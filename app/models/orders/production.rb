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

  has_many :transferences, :foreign_key => :orden_produccion_id, :class_name => Requests::Transferences::Product.to_s
  
  before_destroy :destroy_requests_open
  
  set_table_name "ordenes_producciones"
  alias_attribute :number, :numero
  alias_attribute :status_id, :estado_id
  alias_attribute :user_id, :usuario_id


  validates :estado_id, :presence => true #, :length => { :minimum => 2 }  
  validates :usuario_id, :presence => true #, :length => { :minimum => 2 }  
    
  class << self
    def generated_by_system
      system_user_id = AppConfig.find('system_user_id').value
      open_status_id = AppConfig.find('open_status_id').value
      self.where('usuario_id = ? AND estado_id = ?', system_user_id, open_status_id)
    end
  end
  
    
  def destroy_requests_open
     open_status_id = AppConfig.find('open_status_id').value
     details.each do |dd|
      Requests::Transferences::Component.get_by_order_detail( dd.id, open_status_id).destroy_all
     end
  end
  
  def update_request
    system_user_id = AppConfig.find('system_user_id').value
    open_status_id = AppConfig.find('open_status_id').value

    details.each do |dd|
      request = Requests::Transferences::Component.get_by_order_detail( dd.id, open_status_id).first #|| request = Requests::Transferences::Component.create!({
#          user_id: system_user_id,
#          status_id: open_status_id,
#          order_detail_id: dd.id,
#        })
      
      return false unless request
      
      components = {}    
      dd.product.details.each do |c|
        qtty = c.quantity * dd.quantity
        if components[c.component.id.to_sym]
          components[c.component.id.to_sym] = components[c.component.id.to_sym] + qtty
        else
          components[c.component.id.to_sym] = qtty
        end
      end 
      components.each { |k, v| 
          detail = Requests::Transferences::Components::Detail.get_by_header_and_component(k, request.id).first
          if detail
            detail.quantity = v
            detail.save
          end
      }

    end   
    return true
  end  
  
  def generate_request

    system_user_id = AppConfig.find('system_user_id').value
    open_status_id = AppConfig.find('open_status_id').value
    
    requests_g = []
    
    details.each do |dd|
      components = {}    
      request = Requests::Transferences::Component.get_by_order_detail( dd.id, open_status_id).first
      if ! request
        request =  Requests::Transferences::Component.create!({
          user_id: system_user_id,
          status_id: open_status_id,
          order_detail_id: dd.id })
      
        dd.product.details.each do |c|
          qtty = c.quantity * dd.quantity
          if ! components[c.component.id.to_sym]
            components[c.component.id.to_sym] = qtty
          end
        end 
        components.each { |k, v| 
          detail = Requests::Transferences::Components::Detail.get_by_header_and_component(k, request.id).first
          if detail
            detail.quantity = v
            detail.save
          else 
            Requests::Transferences::Components::Detail.create!({
              component_id: k,
              quantity: v,     
              header_id: request.id  }) 
          end
        }
      else
        update_request
      end
      requests_g << request
    end
    
    requests_g.each do |r|
      r.destroy if r.details.empty?
    end
   
    return true
  end
  
  
  # When an order is closed
  def close
  
    products_transferences = Requests::Transferences::Product.create!({
      user_id: user.id,
      status_id: status.id,
      order_production_id: id
    });
    details.each do |d|
      Requests::Transferences::Products::Detail.create!({
        header_id: products_transferences.id,
        product_id: d.product.id,
        quantity: d.quantity,
        order_production_detail_id: d.id
      })
    end

    if ! products_transferences.close
      products_transferences.details.destroy_all
      products_transferences.destroy
      return false
    end
    
    sum = 0
    component_sum = 0
    details.each do |d|
#      Transaction.create!({
#        kind: self.class.to_s,
#        detail_kind: d.class.to_s,
#        detail_id: d.id,
#        from_stock: Stocks::Production.to_s,
#        to_stock: Stocks::Product.to_s,
#        is_component: false
#      })
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
