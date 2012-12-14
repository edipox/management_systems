class Orders::Production < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

  attr_accessible :status_id, :user_id, :number

  has_many :details, :foreign_key => :orden_produccion_id, :class_name => "Orders::Productions::Detail"

  belongs_to :status, :foreign_key => :estado_id, :class_name => "Transactions::Status"
  belongs_to :user,:foreign_key => :usuario_id

#  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
#  
  #auto_increment :column => :number
  auto_increment :column => :numero
  
  has_many :requests, :foreign_key => :orden_produccion_id, :class_name => Requests::Transferences::Component.to_s
  has_many :transferences, :foreign_key => :orden_produccion_id, :class_name => Requests::Transferences::Product.to_s
  
  before_destroy :destroy_requests_open
  
  set_table_name "ordenes_producciones"
  alias_attribute :number, :numero
  alias_attribute :status_id, :estado_id
  alias_attribute :user_id, :usuario_id


  validates :estado_id, :presence => true #, :length => { :minimum => 2 }  
  validates :usuario_id, :presence => true #, :length => { :minimum => 2 }  
    
  def destroy_requests_open
     system_user_id = AppConfig.find('system_user_id').value
     open_status_id = AppConfig.find('open_status_id').value
     Requests::Transferences::Component.where('order_id = ? AND user_id = ? AND status_id = ?', id, system_user_id, open_status_id).destroy_all
  end
  
  def generate_request
    system_user_id = AppConfig.find('system_user_id').value
    open_status_id = AppConfig.find('open_status_id').value
    
    request = Requests::Transferences::Component.where('order_id = ? AND user_id = ? AND status_id = ?', id, system_user_id, open_status_id).first
    
    if !request 
      request = Requests::Transferences::Component.create!({
        user_id: system_user_id,
        status_id: open_status_id,
        order_id: id,
      })
    end
    
    components = {}    
    details.each do |dd|
      dd.product.details.each do |c|
        qtty = c.quantity * dd.quantity
        if components[c.component.id.to_sym]
          components[c.component.id.to_sym] = components[c.component.id.to_sym] + qtty
        else
          components[c.component.id.to_sym] = qtty
        end
      end 
    end   
    
    components.each { |k, v| 
        detail = Requests::Transferences::Components::Detail.where("component_id = ? AND header_id = ?", k, request.id).first
        if detail
          detail.quantity += v
          detail.save
        else 
          Requests::Transferences::Components::Detail.create!({
            component_id: k,
            quantity: v,     
            header_id: request.id
          }) 
        end
    }
    
    return true
  end
  
  def close
  
    products_transferences = Requests::Transferences::Product.create!({
      user_id: user.id,
      status_id: status.id,
    });
    pt_details = []
    details.each do |d|
      pt_details << Requests::Transferences::Products::Detail.create!({
        header_id: products_transferences.id,
        product_id: d.product.id,
        quantity: d.quantity,
      })
    end
    if ! products_transferences.close
      pt_details.each do |d|
        d.destroy
      end
      products_transferences.destroy
      return false
    end
    products_transferences.status = Transactions::Status.find(AppConfig.find('close_status_id').value)
    products_transferences.save
    sum = 0
    component_sum = 0
    details.each do |d|
      Transaction.create!({
        kind: self.class.to_s,
        detail_kind: d.class.to_s,
        detail_id: d.id,
        from_stock: Stocks::Production.to_s,
        to_stock: Stocks::Product.to_s,
        is_component: false
      })
      sum += d.product.price * d.quantity
      
      d.product.details.each do |dc|
        component_sum += dc.component.price * dc.quantity
      end
      
    end
    
    entry_id = Accounting::Entry.create!({
      description: "Transferencia de productos"    
    }).id
    
    debe_account_id = AppConfig.find('accounting_finished_product_id').value
    haber_account_id = AppConfig.find('accounting_products_in_process_id').value
    
    Accounting::Entries::Detail.create!({
      header_id: entry_id,
      value: sum,
      account_id: debe_account_id,
      is_debe: true
    })
    Accounting::Entries::Detail.create!({
      header_id: entry_id,
      value: component_sum,
      account_id: haber_account_id,
      is_debe: false
    })
    haber_account_id2 = AppConfig.find('accounting_production_recharge_id').value

    Accounting::Entries::Detail.create!({
      header_id: entry_id,
      value: sum - component_sum,
      account_id: haber_account_id2,
      is_debe: false
    })
    
    return true
  end
 
end
