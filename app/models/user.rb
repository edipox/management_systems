class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_accessible :role, :acl_role_id
  belongs_to :acl_role, :class_name => ACL::Role.to_s
  alias_attribute :role, :acl_role

  has_many :requests_transferences_components, :class_name => Requests::Transferences::Component.to_s
  has_many :requests_devolutions_component, :class_name => Requests::Devolutions::Component.to_s

  has_paper_trail
  acts_as_paranoid
  
end
