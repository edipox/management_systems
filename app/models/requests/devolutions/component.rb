class Requests::Devolutions::Component < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

   attr_accessible :number, :reason, :status_id, :user_id, :user, :header_id, :component_id, :component, :status

  has_many :details, :foreign_key => :header_id, :class_name => "Requests::Devolutions::Components::Detail"

  belongs_to :status, :class_name => "Transactions::Status"
  belongs_to :user

  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  validates :reason, :presence => true #, :length => { :minimum => 2 }  
  
  auto_increment :column => :number
  
  def close
    details.each do |d|
      qtty = d.quantity
      quantity_on_production = 0;
      d.component.production_stocks.map{|e| 
        quantity_on_production += e.component_quantity
      }
      if qtty > quantity_on_production
        return false
      end
    end
    details.each do |d|
      id = d.component.id
      price = d.component.price
      qtty = d.quantity
      Stocks::Production.create!({component_id: id, component_quantity: -qtty, component_price: price})
      Stocks::Component.create!({component_id: id, quantity: qtty, price: price})
      Transaction.create!({
        kind: self.class.to_s,
        detail_kind: d.class.to_s,
        detail_id: d.id,
        from_stock: Stocks::Production.to_s,
        to_stock: Stocks::Component.to_s,
        is_component: true
      })
    end
    return true
  end
 
end
