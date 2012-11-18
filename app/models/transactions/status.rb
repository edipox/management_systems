class Transactions::Status < ActiveRecord::Base
   has_paper_trail
  attr_accessible :name
  validates :name, :presence => true, :uniqueness => true
  has_many :requests_transferences_components, :class_name => Requests::Transferences::Component.to_s
  has_many :requests_devolutions_component, :class_name => Requests::Devolutions::Component.to_s
  
end
