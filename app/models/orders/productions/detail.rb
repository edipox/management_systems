class Orders::Productions::Detail < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

  attr_accessible :header_id, :product_id, :quantity, :product
  validates :product_id, :presence => true #, :length => { :minimum => 2 }  
  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  

  belongs_to :product, :foreign_key => :product_id, :class_name => Products::Composition.to_s  
  
  belongs_to :orders_production, :foreign_key => :header_id, :class_name => Orders::Production.to_s
  
  after_save :generate_request
  def generate_request
    orders_production.generate_request
  end

  set_table_name "ordenes_producciones_detalles"
  alias_attribute :quantity, :cantidad
  alias_attribute :product_id, :producto_terminado_id
  alias_attribute :header_id, :orden_produccion_id
  
end
