class Stocks::Component < ActiveRecord::Base
  has_paper_trail
  attr_accessible :component_id, :quantity, :price
  attr_accessible :component
  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
  validates :price, :presence => true

  belongs_to :component, :foreign_key => :component_id, :class_name => Components::Item.to_s

  after_save :check_qty

  def check_qty
    sum = component.raw_material_stocks.reduce { |s1, s2| s1.quantity += s2.quantity; s1 }
    if component.minimum_quantity > sum.quantity
      missing_component_qty = component.minimum_quantity - sum.quantity
      system_user_id = AppConfig.find('system_user_id').value
      open_status_id = AppConfig.find('open_status_id').value
      generated_by_system = Requests::Purchases::Component.where('user_id = ? AND status_id = ?', system_user_id, open_status_id)
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
        request_purchase = Requests::Purchases::Component.create!({
          status_id: open_status_id,
          user_id: system_user_id,
          #temp
          transaction_id: 'nil'
          #temp
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
