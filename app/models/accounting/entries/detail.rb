class Accounting::Entries::Detail < ActiveRecord::Base
   has_paper_trail
  attr_accessible :account, :debe_haber

  has_many :details, :foreign_key => :header_id, :class_name => "Accounting::Entries::Details::Detail"

  belongs_to :status, :class_name => "Transactions::Status"

  validates :account, :presence => true #, :length => { :minimum => 2 }  
  validates :debe_haber, :presence => true #, :length => { :minimum => 2 }  
end
