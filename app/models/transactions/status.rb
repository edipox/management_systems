class Transactions::Status < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

  validates :nombre, :presence => true, :uniqueness => true
  has_many :requests_transferences_components, :foreign_key => :estado_id, :class_name => Requests::Transferences::Component.to_s
  has_many :requests_devolutions_components,  :foreign_key => :estado_id, :class_name => Requests::Devolutions::Component.to_s
  has_many :orders_productions,  :foreign_key => :estado_id, :class_name => Orders::Production.to_s  
  
  set_table_name "transacciones_estados"
  alias_attribute :name, :nombre
end
