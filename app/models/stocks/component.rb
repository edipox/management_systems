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
  alias_attribute :precio, :precio_unitario
  validates :componente_id, :presence => true #, :length => { :minimum => 2 }  
  validates :cantidad, :presence => true #, :length => { :minimum => 2 }  
  validates :precio, :presence => true


  after_save :check_qty

  def check_qty
    sum = component.raw_material_stocks.reduce { |s1, s2| s1.quantity += s2.quantity; s1 }
    if component.minimum_quantity > sum.quantity
      missing_component_qty = component.minimum_quantity - sum.quantity
      system_user_id = AppConfig.find('system_user_id').value
      open_status_id = AppConfig.find('open_status_id').value
      generated_by_system = Requests::Purchases::Component.where('user_id = ? AND status_id = ?', system_user_id, open_status_id)
      detail_generated = nil
      generated_by_system.each do |header|
        header.details.each do |d|
          if d.component.id == component.id
            detail_generated = d
            break
          end
        end
      end
      if detail_generated
        detail_generated.quantity = missing_component_qty
        detail_generated.save
      else
        request_purchase = Requests::Purchases::Component.create!({
          status_id: open_status_id,
          user_id: system_user_id,
        }) 
        Requests::Purchases::Components::Detail.create!({
          header_id: request_purchase.id,
          component: component,
          quantity: missing_component_qty
        })
      end
    end
  end
end
