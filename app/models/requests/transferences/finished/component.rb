class Requests::Transferences::Finished::Component < ActiveRecord::Base
   has_paper_trail
  attr_accessible :status_id, :status, :transaction_id, :user_id, :user, :transaction, :header, :header_id, :component_id, :component, :number

  has_many :details, :foreign_key => :header_id, :class_name => Requests::Transferences::Finished::Components::Detail.to_s

  belongs_to :status, :class_name => Transactions::Status.to_s
  belongs_to :user

  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  validates :transaction_id, :presence => true #, :length => { :minimum => 2 }  
  
  belongs_to :transaction, :foreign_key => :transaction_id, :class_name => Stocks::Transactions::Product.to_s  
  
  auto_increment :column => :number  
  
  def close
    details.each do |d|
      qtty = d.quantity
      quantity_on_raw_material = 0;
      d.component.raw_material_stocks.map{|e| 
        quantity_on_raw_material += e.quantity
      }
      if ! (qtty < quantity_on_raw_material)
        return false
      end
    end
    details.each do |d|
      id = d.component.id
      price = d.component.price
      qtty = d.quantity
      Stocks::Component.create!({component_id: id, quantity: -qtty, price: price})
      Stocks::Product.create!({component_id: id, component_quantity: qtty, component_price: price})
    end
    return true
  end
  
end
