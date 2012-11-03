module ACL
  class EntityCallback
    def after_create(entity)
      roles = Role.order(:created_at)
      roles.each do |role|
        enabled_all = role == roles.first
        PermissionsGenerator.generate(role, entity, enabled_all)
      end
    end
  end

  class Entity < ActiveRecord::Base
    attr_accessible :const, :name
    after_create ::ACL::EntityCallback.new

    has_many :permissions
  end
end
