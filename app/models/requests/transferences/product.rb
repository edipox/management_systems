class Requests::Transferences::Product < ActiveRecord::Base
   has_paper_trail
  attr_accessible :status_id, :transaction_id, :user_id, :user, :transaction, :header_id, :header, :product_id, :product, :number

  has_many :details, :foreign_key => :header_id, :class_name => "Requests::Transferences::Products::Detail"

  belongs_to :status, :class_name => "Transactions::Status"
  belongs_to :user

  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  validates :transaction_id, :presence => true #, :length => { :minimum => 2 }  
  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  belongs_to :transaction, :foreign_key => :transaction_id, :class_name => "Stocks::Transactions::Product"    
  
  auto_increment :column => :number  
end
