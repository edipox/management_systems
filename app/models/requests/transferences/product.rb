class Requests::Transferences::Product < ActiveRecord::Base
   has_paper_trail
  attr_accessible :status_id, :user_id, :user, :number

  has_many :details, :foreign_key => :header_id, :class_name => "Requests::Transferences::Products::Detail"

  belongs_to :status, :class_name => "Transactions::Status"
  belongs_to :user

  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  
  auto_increment :column => :number  
  
  
  def close
    details.each do |dd|
  
      dd.product.details.each do |d|
        qtty = d.quantity
        quantity_on_production = 0;
        d.component.production_stocks.map{|e| 
          quantity_on_production += e.component_quantity
        }
        if qtty > quantity_on_production
          return false
        end
      end
    end
    
    details.each do |dd|
      dd.product.details.each do |d|
        id = d.component.id
        price = d.component.price
        qtty = d.quantity
        Stocks::Production.create!({component_id: id, component_quantity: -qtty, component_price: price})

        Transaction.create!({
          kind: self.class.to_s,
          detail_kind: d.class.to_s,
          detail_id: d.id,
          from_stock: Stocks::Production.to_s,
          to_stock: Stocks::Component.to_s,
          is_component: true
        })

      end
      Stocks::Product.create!({product_id: dd.product_id, product_quantity: dd.quantity, product_price: dd.product.price})

      Transaction.create!({
        kind: self.class.to_s,
        detail_kind: dd.class.to_s,
        detail_id: dd.id,
        from_stock: Stocks::Production.to_s,
        to_stock: Stocks::Product.to_s,
        is_component: false
      })
      
    end
    
    return true
  end
  
  
end
