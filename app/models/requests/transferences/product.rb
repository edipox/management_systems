class Requests::Transferences::Product < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

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
    sum = 0
    details.each do |dd|
      dd.product.details.each do |d|
        id = d.component.id
        price = d.component.price
        qtty = d.quantity
        Stocks::Production.create!({component_id: id, component_quantity: -qtty, component_price: price})
        sum += price * qtty
      end
      Stocks::Product.create!({product_id: dd.product_id, product_quantity: dd.quantity, product_price: dd.product.price})
      
    end
    
    
    entry_id = Accounting::Entry.create!({
      description: "Transferencia de productos"    
    }).id
    
    debe_account = acc = Accounting::Account.create!({
      entrable: true,
      name: "Productos terminados"
    })
    haber_account = acc = Accounting::Account.create!({
      entrable: true,
      name: "Productos en curso"
    })
    Accounting::Entries::Detail.create!({
      header_id: entry_id,
      value: sum,
      account_id: debe_account.id,
      is_debe: true
    })
    Accounting::Entries::Detail.create!({
      header_id: entry_id,
      value: sum,
      account_id: haber_account.id,
      is_debe: false
    })
    
    return true
  end
  
  
end
