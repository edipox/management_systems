class Products::Composition < ActiveRecord::Base
  has_paper_trail
  acts_as_paranoid

  attr_accessible :description, :name, :minimum_quantity, :price, :quantity
#  validates :name, :presence => true #, :length => { :minimum => 2 }  
#  
#  validates :minimum_quantity, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }
#  validates :price, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }

  has_many :details, :foreign_key => :producto_terminado_id, :class_name => Products::Compositions::Detail.to_s
  
  belongs_to :status, :foreign_key => :estado_id, :class_name => "Transactions::Status"

  has_many :orders_productions_details, :foreign_key => :producto_terminado_id, :class_name => Orders::Productions::Detail.to_s
  
  has_many :requests_transferences_products_details, :foreign_key => :producto_terminado_id, :class_name => Requests::Transferences::Products::Detail.to_s
  
  has_many :requests_devolutions_products_details, :foreign_key => :producto_id, :class_name => Requests::Devolutions::Products::Detail.to_s
  
  has_many :production_stocks, :foreign_key => :producto_terminado_id, :class_name => ::Stocks::Production.to_s
  
  has_many :products_stocks, :foreign_key => :producto_terminado_id, :class_name => ::Stocks::Product.to_s
  
  set_table_name "productos_terminados"
  alias_attribute :minimum_quantity, :stock_minimo
  alias_attribute :name, :nombre
  alias_attribute :price, :precio
  alias_attribute :description, :descripcion
  
  validates :nombre, :presence => true #, :length => { :minimum => 2 }  
  
  validates :stock_minimo, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }
  validates :precio, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }
  
  
end
