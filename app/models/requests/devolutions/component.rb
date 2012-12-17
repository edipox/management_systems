class Requests::Devolutions::Component < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

   attr_accessible :number, :reason, :status_id, :user_id, :user, :header_id, :component_id, :component, :status

  has_many :details, :foreign_key => :devoluciones_componentes_id, :class_name => "Requests::Devolutions::Components::Detail"

  belongs_to :status,  :foreign_key => :estado_id, :class_name => "Transactions::Status"
  belongs_to :user, :foreign_key => :usuario_id 

#  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :reason, :presence => true #, :length => { :minimum => 2 }  
  
  #auto_increment :column => :number
  auto_increment :column => :numero
  
  set_table_name "devoluciones_componentes"
  alias_attribute :number, :numero
  alias_attribute :reason, :motivo
  alias_attribute :user_id, :usuario_id
  alias_attribute :status_id, :estado_id

  validates :estado_id, :presence => true #, :length => { :minimum => 2 }  
  validates :usuario_id, :presence => true #, :length => { :minimum => 2 }  
  validates :motivo, :presence => true #, :length => { :minimum => 2 }  
    
  
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
    sum = 0
    details.each do |d|
      id = d.component.id
      price = d.component.price
      qtty = d.quantity
      Stocks::Production.create!({component_id: id, component_quantity: -qtty, component_price: price})
      Stocks::Component.create!({component_id: id, quantity: qtty, price: price})
#      Transaction.create!({
#        kind: self.class.to_s,
#        detail_kind: d.class.to_s,
#        detail_id: d.id,
#        from_stock: Stocks::Production.to_s,
#        to_stock: Stocks::Component.to_s,
#        is_component: true
#      })
      sum += price * qtty
    end
     
    
    entry_id = Accounting::Entry.create!({
      description: "Devoluciones de componentes y operaciones similares"    
    }).id
    
    debe_account_id = AppConfig.find('accounting_purchases_devolutions_id').value;

    haber_account_id = AppConfig.find('to_accounting_raw_materials_id').value 
    
    Accounting::Entries::Detail.create!({
      header_id: entry_id,
      value: sum,
      account_id: debe_account_id
    })
    Accounting::Entries::Detail.create!({
      header_id: entry_id,
      value: sum,
      account_id: haber_account_id
    })
   
    return true
  end
 
end
