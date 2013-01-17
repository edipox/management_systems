class Stocks::Production < ActiveRecord::Base
  has_paper_trail
  acts_as_paranoid

  attr_accessible :component_id, :component_quantity, :component_price, :product_id, :product_quantity, :product_price
  #validates :component_id, :presence => true #, :length => { :minimum => 2 }
  #validates :product_id, :presence => true #, :length => { :minimum => 2 }      
  #validates :coquantity, :presence => true #, :length => { :minimum => 2 }  
  #validates :price, :presence => true
  belongs_to :component, :foreign_key => :componente_id, :class_name => Components::Item.to_s
  belongs_to :product, :foreign_key => :producto_terminado_id, :class_name => Products::Composition.to_s  
  
  set_table_name "stock_producciones"
  alias_attribute :component_quantity, :cantidad_componente
  alias_attribute :product_quantity, :cantidad_producto
  alias_attribute :component_id, :componente_id
  alias_attribute :product_id, :producto_terminado_id
  alias_attribute :product_price, :precio_unitario_producto
  alias_attribute :component_price, :precio_unitario_componente

  def self.subtract params
    Stocks::Manager.subtract 'production_stocks', params
  end


  def self.component_valuation component
    quantity_on_stock = 0.0
    price_sum = 0.0
    component.production_stocks.each do |e|
      quantity_on_stock += e.component_quantity || 0
      price_sum += e.component_price || 0
    end
    price_sum# / quantity_on_stock
  end


  def self.product_valuation product
    quantity_on_stock = 0.0
    price_sum = 0.0
    product.production_stocks.each do |e|
      quantity_on_stock += e.product_quantity || 0
      price_sum += e.product_price || 0
    end
    price_sum# / quantity_on_stock
  end

end
