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

  has_many :permissions, :class_name => 'ACL::Permission'
  has_many :users

  after_create ::ACL::RoleCallback.new
end
