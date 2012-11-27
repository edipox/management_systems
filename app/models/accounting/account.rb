class Accounting::Account < ActiveRecord::Base
  has_paper_trail
  attr_accessible :entrable, :name

  has_many :details, :foreign_key => :account, :class_name => "Accounting::Entries::Detail"

  validates :name, :presence => true #, :length => { :minimum => 2 }  
  validates :entrable, :presence => true #, :length => { :minimum => 2 }  
end
