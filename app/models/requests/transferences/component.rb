class Requests::Transferences::Component < ActiveRecord::Base
   has_paper_trail
  attr_accessible :status_id, :status, :transaction_id, :user_id, :user, :transaction, :header, :header_id, :component_id, :component

  has_many :details, :foreign_key => :header_id, :class_name => Requests::Transferences::Components::Detail.to_s

  belongs_to :status, :class_name => Transactions::Status.to_s
  belongs_to :user

  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  validates :transaction_id, :presence => true #, :length => { :minimum => 2 }  
  
  belongs_to :transaction, :foreign_key => :transaction_id, :class_name => "Stocks::Transactions::Production"  
  
  
end
