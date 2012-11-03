module ACL
  class Permission < ActiveRecord::Base
    attr_accessible :role, :entity, :action, :enabled

    belongs_to :role
    belongs_to :entity
  end
end
