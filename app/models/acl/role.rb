module ACL
  class RoleCallbacks
    def after_create(role)
      admin = Role.order(:created_at).first
      Entity.all.each do |entity|
        enabled = admin.id == role.id
        PermissionsGenerator.generate(role, entity, enabled)
      end
    end
  end
end

class ACL::Role < ActiveRecord::Base
  attr_accessible :name

  has_many :acl_permissions, :class_name => ACL::Permission.to_s
  alias_attribute :permissions, :acl_permissions

  after_create ACL::RoleCallbacks.new
end
