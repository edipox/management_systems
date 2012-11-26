class Requests::Devolutions::Component < ActiveRecord::Base
   has_paper_trail
   attr_accessible :number, :reason, :status_id, :transaction_id, :user_id, :user, :transaction, :header_id, :component_id, :component, :status

  has_many :details, :foreign_key => :header_id, :class_name => "Requests::Devolutions::Components::Detail"

  belongs_to :status, :class_name => "Transactions::Status"
  belongs_to :user

  validates :transaction_id, :presence => true #, :length => { :minimum => 2 }  
  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  validates :reason, :presence => true #, :length => { :minimum => 2 }  
  
  belongs_to :transaction, :foreign_key => :transaction_id, :class_name => "Stocks::Transactions::Component"


#  before_create :set_number
#  def set_number
#    max_number = Requests::Devolutions::Component.maximum(:number)
#    self.number = max_number.to_i + 1
#  end
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
      Stocks::Component.create!({component_id: id, quantity: qtty, price: price})
      Stocks::Production.create!({component_id: id, component_quantity: -qtty, component_price: price})
    end
    return true
  end
 
end
