class Requests::Purchases::Component < ActiveRecord::Base
  acts_as_paranoid
   has_paper_trail
  attr_accessible :status_id, :status, :user_id, :user, :header, :header_id, :number

  has_many :details, :foreign_key => :pedidos_compras_componentes_id, :class_name => Requests::Purchases::Components::Detail.to_s

  belongs_to :status,  :foreign_key => :estado_id, :class_name => Transactions::Status.to_s
  belongs_to :user, :foreign_key => :usuario_id

#  validates :status_id, :presence => true
#  validates :user_id, :presence => true
  
#  auto_increment :column => :number  
  auto_increment :column => :numero
   
  set_table_name "pedidos_compras_componentes"
  alias_attribute :number, :numero
  alias_attribute :status_id, :estado_id
  alias_attribute :user_id, :usuario_id

  validates :estado_id, :presence => true
  validates :usuario_id, :presence => true
  
  class << self
    def generated_by_system
      system_user_id = AppConfig.find('system_user_id').value
      open_status_id = AppConfig.find('open_status_id').value
      return self.where('usuario_id = ? AND estado_id = ?', system_user_id, open_status_id)
    end
  end
  
  def close
  
    sum = 0
    
    details.each do |d|
      
      sum += d.component.price * d.quantity
      
      Stocks::Component.create!({
        component_id: d.component.id,
        quantity: d.quantity,
        price: d.component.price
      })
      
#      Transaction.create!({
#        kind: self.class.to_s,
#        detail_kind: d.class.to_s,
#        detail_id: d.id,
#        from_stock: "Compras",
#        to_stock: Stocks::Component.to_s,
#        is_component: true
#      })
    
    end
    
    entry_id = Accounting::Entry.create!({
      description: "Compra de componentes"    
    }).id
    
    debe_account_id = AppConfig.find('accounting_raw_materials_id').value
    
    haber_account_id = AppConfig.find('to_accounting_box_id').value
    
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
