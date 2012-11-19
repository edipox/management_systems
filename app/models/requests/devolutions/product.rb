class Requests::Devolutions::Product < ActiveRecord::Base
   has_paper_trail
  attr_accessible :reason, :status_id, :transaction_id, :user_id, :user, :transaction, :header_id, :product_id, :product, :status

  has_many :details, :foreign_key => :header_id, :class_name => "Requests::Devolutions::Products::Detail"
  belongs_to :user
  belongs_to :status, :class_name => "Transactions::Status"

  validates :transaction_id, :presence => true #, :length => { :minimum => 2 }  
  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  validates :reason, :presence => true #, :length => { :minimum => 2 }  
  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  belongs_to :transaction, :foreign_key => :transaction_id, :class_name => "Stocks::Transactions::Product"  
end
