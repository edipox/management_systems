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
end

class ACL::Entity < ActiveRecord::Base
  attr_accessible :const, :name

  has_many :acl_permissions, :class_name => ACL::Permission.to_s
  alias_attribute :permissions, :acl_permissions

  after_create ACL::EntityCallbacks.new

  has_paper_trail
end
