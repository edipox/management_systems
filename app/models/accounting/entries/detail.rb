class Accounting::Entries::Detail < ActiveRecord::Base
  has_paper_trail
  attr_accessible :account_id, :account, :is_debe, :header_id, :value

  belongs_to :entry, :foreign_key => :header_id, :class_name => "Accounting::Entry"
  belongs_to :account, :foreign_key => :account_id, :class_name => "Accounting::Account"

  validates :account, :presence => true #, :length => { :minimum => 2 }  
  validates :value, :presence => true #, :length => { :minimum => 2 }    
  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
end
