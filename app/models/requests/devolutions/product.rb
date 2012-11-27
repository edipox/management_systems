class Requests::Devolutions::Product < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid
  attr_accessible :reason, :status_id, :user_id, :user, :header_id, :product_id, :product, :status, :number

  has_many :details, :foreign_key => :header_id, :class_name => Requests::Devolutions::Products::Detail.to_s
  belongs_to :user
  belongs_to :status, :class_name => Transactions::Status.to_s

  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  validates :reason, :presence => true #, :length => { :minimum => 2 }  
  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  auto_increment :column => :number
  
  
    
  def close
    details.each do |d|
      qtty = d.quantity
      quantity_on_products = 0;
      d.product.products_stocks.map{|e| 
        quantity_on_products += e.quantity
      }
      if ! (qtty < quantity_on_products)
        return false
      end
    end
    details.each do |d|
      id = d.product.id
      price = d.product.price
      qtty = d.quantity
      Stocks::Production.create!({product_id: id, product_quantity: qtty, product_price: price})
      Stocks::Product.create!({product_id: id, quantity: -qtty, price: price})
      Transaction.create!({
        kind: self.class.to_s,
        detail_kind: d.class.to_s,
        detail_id: d.id,
        from_stock: Stocks::Production.to_s,
        to_stock: Stocks::Product.to_s,
        is_component: false
      })      
    end
    return true
  end
  
  
  
end
