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
  
  after_save :generate_request
  
  has_many :requests, :foreign_key => :order_id, :class_name => Requests::Transferences::Component.to_s
  
  def generate_request
    system_user_id = AppConfig.find('system_user_id').value
    open_status_id = AppConfig.find('open_status_id').value
    request_id = Requests::Transferences::Component.create!({
      user_id: system_user_id,
      status_id: open_status_id,
      #temp
      transaction_id: 'nil'
      #temp    
    }).id
    details.each do |dd|
      dd.product.details.each do |c|
        if ! Requests::Transferences::Components::Detail.create!({
          component: c.component,
          quantity: c.quantity,     
          header_id: request_id
        })
          return false
        end
      end    
    end
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
