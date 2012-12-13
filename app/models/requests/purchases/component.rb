class Requests::Purchases::Component < ActiveRecord::Base
  acts_as_paranoid
   has_paper_trail
  attr_accessible :status_id, :status, :user_id, :user, :header, :header_id, :number

  has_many :details, :foreign_key => :header_id, :class_name => Requests::Purchases::Components::Detail.to_s

  belongs_to :status, :class_name => Transactions::Status.to_s
  belongs_to :user

  validates :status_id, :presence => true
  validates :user_id, :presence => true
  
  auto_increment :column => :number  
  
  set_table_name "pedidos_compras_componentes"
  alias_attribute :number, :numero
  alias_attribute :status_id, :estado_id
  alias_attribute :user_id, :usuario_id
  
  def close
  
    sum = 0
    
    details.each do |d|
      
      sum += d.component.price * d.quantity
      
      Stocks::Component.create!({
        component_id: d.component.id,
        quantity: d.quantity,
        price: d.component.price
      })
      
      Transaction.create!({
        kind: self.class.to_s,
        detail_kind: d.class.to_s,
        detail_id: d.id,
        from_stock: "Compras",
        to_stock: Stocks::Component.to_s,
        is_component: true
      })
    
    end
    
    entry_id = Accounting::Entry.create!({
      description: "Compra de componentes"    
    }).id
    
    debe_account_id = AppConfig.find('accounting_raw_materials_id').value
    
    haber_account_id = AppConfig.find('accounting_box_id').value
    
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
