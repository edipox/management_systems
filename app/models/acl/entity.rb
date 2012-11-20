module ACL
  class EntityCallbacks
    def after_create(entity)
      admin = Role.order(:created_at).first
      Role.all.each do |role|
        enabled = role.id == admin.id
        PermissionsGenerator.generate(role, entity, enabled)
      end
    end
  end

  module EntityMethods
    def create_extra_action(name, symbol)
      action = ACL::Action.create!({ name: name, symbol: symbol, extra: true })

      # Generate Permissions
      roles = ACL::Role.all
      admin_role = ACL::Role.find AppConfig.get('admin_role_id')
      roles = roles - [admin_role]

      roles.each do |role|
        PermissionsGenerator.generate(role, self, false, [action])
      end

      PermissionsGenerator.generate(admin_role, self, true, [action])
    end
  end
end

class ACL::Entity < ActiveRecord::Base
  include ACL::EntityMethods
  attr_accessible :const, :name

  has_many :acl_permissions, :class_name => ACL::Permission.to_s
  alias_attribute :permissions, :acl_permissions

  after_create ACL::EntityCallbacks.new

  has_paper_trail
end
