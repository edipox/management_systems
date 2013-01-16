class Stocks::Component < ActiveRecord::Base
  has_paper_trail
  acts_as_paranoid

  attr_accessible :component_id, :quantity, :price
  attr_accessible :component
#  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
#  validates :price, :presence => true

  belongs_to :component, :foreign_key => :componente_id, :class_name => Components::Item.to_s

  set_table_name "stock_materias_primas"
  alias_attribute :component_id, :componente_id
  alias_attribute :quantity, :cantidad
  alias_attribute :price, :precio_unitario
  validates :componente_id, :presence => true #, :length => { :minimum => 2 }  
  validates :cantidad, :presence => true #, :length => { :minimum => 2 }  
  validates :precio_unitario, :presence => true


  after_save :check_qty

  def check_qty
#    Components::Item.all.each do |component|
      #sum = component.raw_material_stocks.reduce { |s1, s2| s1.quantity += s2.quantity; s1 }
      quantity_on_stock = 0
      component.raw_material_stocks.map{ |e| 
        quantity_on_stock += e.quantity || 0
      }
      if component.minimum_quantity > quantity_on_stock
        missing_component_qty = component.minimum_quantity - quantity_on_stock
        system_user_id = AppConfig.find('system_user_id').value
        open_status_id = AppConfig.find('open_status_id').value
        generated_by_system = Requests::Purchases::Component.generated_by_system.first
        detail_generated = nil

        request_purchase = generated_by_system || Requests::Purchases::Component.create!({
          status_id: open_status_id,
          user_id: system_user_id,
        })
        Requests::Purchases::Components::Detail.create!({
          header_id: request_purchase.id,
          component: component,
          quantity: missing_component_qty
        })
     
      end
#    end
  end

  def self.subtract params
    Stocks::Manager.subtract 'raw_material_stocks', params
  end

end
