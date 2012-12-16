class Requests::Transferences::Finished::Component < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

  attr_accessible :status_id, :status, :user_id, :user, :header, :header_id, :number
  #:component_id, :component, :number

  has_many :details, :foreign_key => :solicitud_componentes_id, :class_name => Requests::Transferences::Finished::Components::Detail.to_s

  belongs_to :status, :foreign_key => :estado_id,  :class_name => Transactions::Status.to_s
  belongs_to :user, :foreign_key => :usuario_id

#  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  
  auto_increment :column => :numero
  
  set_table_name "solicitudes_componentes"
  alias_attribute :number, :numero
  alias_attribute :status_id, :estado_id
  alias_attribute :user_id, :usuario_id
  
  
  validates :estado_id, :presence => true #, :length => { :minimum => 2 }  
  validates :usuario_id, :presence => true #, :length => { :minimum => 2 }  
  
  
  def close
    details.each do |d|
      qtty = d.quantity
      quantity_on_raw_material = 0;
      d.component.raw_material_stocks.map{|e| 
        quantity_on_raw_material += e.quantity
      }
      if qtty > quantity_on_raw_material
        return false
      end
    end
    sum = 0
    details.each do |d|
      id = d.component.id
      price = d.component.price
      qtty = d.quantity
      Stocks::Component.create!({component_id: id, quantity: -qtty, price: price})
      Stocks::Product.create!({component_id: id, component_quantity: qtty, component_price: price})
      
#      Transaction.create!({
#        kind: self.class.to_s,
#        detail_kind: d.class.to_s,
#        detail_id: d.id,
#        from_stock: Stocks::Component.to_s,
#        to_stock: Stocks::Product.to_s,
#        is_component: true
#      })
      sum += qtty * price
    end
    
    entry_id = Accounting::Entry.create!({
      description: "Transferencia de comerciales"    
    }).id
    
    debe_account_id = AppConfig.find("accounting_comercials_id").value
    haber_account_id = AppConfig.find('accounting_raw_materials_id').value
    Accounting::Entries::Detail.create!({
      header_id: entry_id,
      value: sum,
      account_id: debe_account_id,
      is_debe: true
    })
    Accounting::Entries::Detail.create!({
      header_id: entry_id,
      value: sum,
      account_id: haber_account_id,
      is_debe: false
    })
   
    return true
  end
  
end
