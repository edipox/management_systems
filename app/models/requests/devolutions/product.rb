class Requests::Devolutions::Product < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid
  attr_accessible :reason, :status_id, :user_id, :user, :header_id, :product_id, :product, :status, :number

  has_many :details, :foreign_key => :devoluciones_productos_id, :class_name => Requests::Devolutions::Products::Detail.to_s
  belongs_to :user, :foreign_key => :usuario_id
  belongs_to :status,  :foreign_key => :estado_id, :class_name => Transactions::Status.to_s

#  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :reason, :presence => true #, :length => { :minimum => 2 }  
#  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
#  auto_increment :column => :number
   auto_increment :column => :numero
  
  set_table_name "devoluciones_productos"
  alias_attribute :number, :numero
  alias_attribute :reason, :motivo
  alias_attribute :user_id, :usuario_id
  alias_attribute :status_id, :estado_id

  validates :usuario_id, :presence => true #, :length => { :minimum => 2 }  
  validates :motivo, :presence => true #, :length => { :minimum => 2 }  
  validates :estado_id, :presence => true #, :length => { :minimum => 2 }  
    
  def close
    details.each do |d|
      qtty = d.quantity
      quantity_on_products = 0;
      d.product.products_stocks.map{|e| 
        quantity_on_products += e.product_quantity
      }
      if qtty > quantity_on_products
        return false
      end
    end
    sum = 0
    details.each do |d|
      id = d.product.id
      price = d.product.price
      qtty = d.quantity
      Stocks::Production.create!({product_id: id, product_quantity: qtty, product_price: price})
      return false unless Stocs::Product.subtract({product_id: id, product_quantity: qtty, product_price: price})
      #Stocks::Product.create!({product_id: id, product_quantity: -qtty, product_price: price})
#      Transaction.create!({
#        kind: self.class.to_s,
#        detail_kind: d.class.to_s,
#        detail_id: d.id,
#        from_stock: Stocks::Production.to_s,
#        to_stock: Stocks::Product.to_s,
#        is_component: false
#      })   
      
      sum += qtty * price   
    end

    entry_id = Accounting::Entry.create!({
      description: "Devoluciones de productos y operaciones similares"    
    }).id
    
    debe_account_id = AppConfig.find('accounting_sell_devolutions_id').value
    
    haber_account_id = AppConfig.find('to_accounting_finished_product_id').value
    
    Accounting::Entries::Detail.create!({
      header_id: entry_id,
      value: sum,
      account_id: debe_account_id,
    })
    Accounting::Entries::Detail.create!({
      header_id: entry_id,
      value: sum,
      account_id: haber_account_id,
    })
   
    return true
  end
  
  
  
end
