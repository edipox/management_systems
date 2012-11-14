class Stocks::Transactions::Component < ActiveRecord::Base
   has_paper_trail
  attr_accessible :kind, :kind_id
  validates :kind, :presence => true #, :length => { :minimum => 2 }  
  validates :kind_id, :presence => true #, :length => { :minimum => 2 }  
  
  has_one :devolution, :foreign_key => :transaction_id, :class_name => "Requests::Devolutions::Component"
  has_one :devolution, :foreign_key => :transaction_id, :class_name => "Requests::Purchases::Component"  
end
