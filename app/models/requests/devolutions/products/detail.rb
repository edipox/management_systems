class Requests::Devolutions::Products::Detail < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

  attr_accessible :header_id, :product_id,:quantity, :product, :requests_devolutions_product
  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
  validates :product_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
    
  belongs_to :requests_devolutions_product, :foreign_key => :header_id, :class_name => Requests::Devolutions::Product.to_s
  belongs_to :product, :foreign_key => :product_id, :class_name => Products::Composition.to_s  
  
  set_table_name "devoluciones_productos_detalles"
  alias_attribute :quantity, :cantidad
  alias_attribute :header_id, :devoluciones_productos_id
  alias_attribute :product_id, :producto_id 
end
