class ACL::Permission < ActiveRecord::Base
  attr_accessible :action_id, :entity_id, :role_id, :enabled

  attr_accessible :action, :role, :entity

  belongs_to :action, :class_name => ACL::Action.to_s
  belongs_to :entity, :class_name => ACL::Entity.to_s
  belongs_to :role, :class_name => ACL::Role.to_s

  has_paper_trail
end
