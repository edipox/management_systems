class Orders::Production < ActiveRecord::Base
   has_paper_trail
  attr_accessible :status_id, :transaction_id, :user_id, :number

  has_many :details, :foreign_key => :header_id, :class_name => "Orders::Productions::Detail"

  belongs_to :status, :class_name => "Transactions::Status"
  belongs_to :user

  validates :transaction_id, :presence => true #, :length => { :minimum => 2 }  
  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  belongs_to :transaction, :foreign_key => :transaction_id, :class_name => "Stocks::Transactions::Production"    
  
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
        #temp
        transaction_id: 'nil'
        #temp    
    })
    
    components = {}    
    details.each do |dd|
      dd.product.details.each do |c|
        if components[c.component.id.to_sym]
          components[c.component.id.to_sym] = components[c.component.id.to_sym] + c.quantity
        else
          components[c.component.id.to_sym] = c.quantity
        end
      end 
    end   
    
    components.each { |k, v| 
        detail = Requests::Transferences::Components::Detail.where("component_id = ? AND header_id = ?", k, request.id).first || Requests::Transferences::Components::Detail.create!({
          component_id: k,
          quantity: 0,     
          header_id: request.id
        })
        detail.quantity += v
        detail.save
    }
    
    return true
  end
  
  def close
  
    products_transferences = Requests::Transferences::Product.create!({
      user_id: user.id,
      status_id: status.id,
      # temp
      transaction_id: transaction_id
      # temp
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
    return true
  end
 
end
