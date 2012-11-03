module ACL
  class RoleCallback
    def after_create(role)
      Entity.all.each do |entity|
        PermissionsGenerator.generate(role, entity)
      end
    end
  end
end

class Role < ActiveRecord::Base
  attr_accessible :name

  has_many :permissions

  after_create ::ACL::RoleCallback.new
end
