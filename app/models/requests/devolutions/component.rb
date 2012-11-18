class Requests::Devolutions::Component < ActiveRecord::Base
   has_paper_trail
  attr_accessible :reason, :status_id, :transaction_id, :user_id

  has_many :details, :foreign_key => :header_id, :class_name => "Requests::Devolutions::Components::Detail"

  belongs_to :status, :class_name => "Transactions::Status"
  belongs_to :user

  validates :transaction_id, :presence => true #, :length => { :minimum => 2 }  
  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  validates :reason, :presence => true #, :length => { :minimum => 2 }  
  
  belongs_to :transaction, :foreign_key => :transaction_id, :class_name => "Stocks::Transactions::Component"
end
