class Accounting::Account < ActiveRecord::Base
   has_paper_trail
  attr_accessible :entrable, :name

  has_many :details, :foreign_key => :header_id, :class_name => "Accounting::Accounts::Detail"

  belongs_to :status, :class_name => "Transactions::Status"

  validates :name, :presence => true #, :length => { :minimum => 2 }  
  validates :entrable, :presence => true #, :length => { :minimum => 2 }  
end
