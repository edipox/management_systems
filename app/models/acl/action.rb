class ACL::Action < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :name, :symbol, :extra

  has_many :acl_permissions, :class_name => ACL::Permission.to_s
  alias_attribute :permissions, :acl_permissions

  attr_accessible :entity
  belongs_to :entity, :class_name => ACL::Entity.to_s

  has_paper_trail
end
