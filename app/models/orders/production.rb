class Orders::Production < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

  attr_accessible :status_id, :user_id, :number

  has_many :details, :foreign_key => :header_id, :class_name => "Orders::Productions::Detail"

  belongs_to :status, :class_name => "Transactions::Status"
  belongs_to :user

  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  
  auto_increment :column => :number
  
  has_many :requests, :foreign_key => :order_id, :class_name => Requests::Transferences::Component.to_s
  
  before_destroy :destroy_requests_open
  
  def destroy_requests_open
    
  end
  
  def generate_request
    system_user_id = AppConfig.find('system_user_id').value
    open_status_id = AppConfig.find('open_status_id').value
    request = Requests::Transferences::Component.where('order_id = ? AND user_id = ? AND status_id = ?', id, system_user_id, open_status_id).first || Requests::Transferences::Component.create!({
        user_id: system_user_id,
        status_id: open_status_id,
        order_id: id,
    })
    
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
    
#    return true
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
    
    details.each do |d|
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
