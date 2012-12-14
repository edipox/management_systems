module ACL
  class RoleCallbacks
    def after_create(role)
      #admin = Role.order(:created_at).first
      begin admin = Role.find AppConfig.find('admin_role_id').value
      rescue ActiveRecord::RecordNotFound
        admin = Role.new
      end

      Entity.all.each do |entity|
        enabled = admin.id == role.id
        PermissionsGenerator.generate(role, entity, enabled)
      end
    end
  end
end

class ACL::Role < ActiveRecord::Base
  attr_accessible :name
#  validates :name, { presence: true, uniqueness: true }
  validates :nombre, { presence: true, uniqueness: true }
  
  acts_as_paranoid

  has_many :acl_permissions,:foreign_key => :rol_id, :class_name => ACL::Permission.to_s
  alias_attribute :permissions, :acl_permissions

  after_create ACL::RoleCallbacks.new
  default_scope order(:created_at)

  has_many :users, :foreign_key => :acl_role_id

  has_paper_trail
  set_table_name "lca_roles"
  alias_attribute :name, :nombre
end
