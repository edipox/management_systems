class Stocks::Product < ActiveRecord::Base
  has_paper_trail
  acts_as_paranoid

  attr_accessible :component_id, :component_quantity, :component_price, :product_id, :product_quantity, :product_price
#  validates :product_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :price, :presence => true
#  validates :quantity, :presence => true #, :length => { :minimum => 2 }
  belongs_to :product, :foreign_key => :producto_terminado_id, :class_name => Products::Composition.to_s      
  belongs_to :component, :foreign_key => :componente_id, :class_name => Components::Item.to_s 
  
  set_table_name "stock_productos_terminados"
  alias_attribute :component_quantity, :cantidad_componente
  alias_attribute :product_quantity, :cantidad_producto
  alias_attribute :component_id, :componente_id
  alias_attribute :product_id, :producto_terminado_id
  alias_attribute :product_price, :precio_unitario_producto
  alias_attribute :component_price, :precio_unitario_componente
  
  after_save :check_qty

  def check_qty
    if product
    
      sum = product.products_stocks.reduce { |s1, s2| s1.product_quantity += s2.product_quantity; s1 }
      if product.minimum_quantity > sum.product_quantity
        missing_product_qty = product.minimum_quantity - sum.product_quantity
        system_user_id = AppConfig.find('system_user_id').value
        open_status_id = AppConfig.find('open_status_id').value
        generated_by_system = Orders::Production.generated_by_system
        detail_generated = nil
        generated_by_system.each do |e|
          e.details.each do |d|
            if d.product = product
              detail_generated = d
              break
            end
          end
        end
        if detail_generated
          detail_generated.quantity = missing_product_qty
          detail_generated.save
        else
          order_prod = Orders::Production.create!({
            status_id: open_status_id,
            user_id: system_user_id,
          }) 
          Orders::Productions::Detail.create!({
            header_id: order_prod.id,
            product: product,
            quantity: missing_product_qty
          })
        end
      end
      
    else
     sum = component.products_stocks.reduce { |s1, s2|
      s1.component_quantity += s2.component_quantity; s1 }
     if component.minimum_quantity > sum.component_quantity
        missing_component_qty = component.minimum_quantity - sum.component_quantity
        system_user_id = AppConfig.find('system_user_id').value
        open_status_id = AppConfig.find('open_status_id').value
        generated_by_system = Requests::Transferences::Finished::Component.generated_by_system
        detail_generated = nil
        generated_by_system.each do |e|
          e.details.each do |d|
            if d.component = component
              detail_generated = d
              break
            end
          end
        end
        if detail_generated
          detail_generated.quantity = missing_component_qty
          detail_generated.save
        else
          request_finished = Requests::Transferences::Finished::Component.create!({
            status_id: open_status_id,
            user_id: system_user_id
          })
          Requests::Transferences::Finished::Components::Detail.create!({
            header_id: request_finished.id,
            component: component,
            quantity: missing_component_qty 
          })
        end
      end
     
    end
    
  end
  
  def self.subtract params
    Stocks::Manager.subtract self, 'products_stocks', params
  end

end
