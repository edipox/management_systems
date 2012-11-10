class ACL::Action < ActiveRecord::Base
  attr_accessible :name, :symbol

  has_many :acl_permissions, :class_name => ACL::Permission.to_s
  alias_attribute :permissions, :acl_permissions

  has_paper_trail
end
