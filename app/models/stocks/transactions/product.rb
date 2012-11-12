class Stocks::Transactions::Product < ActiveRecord::Base
   has_paper_trail
  attr_accessible :kind, :kind_id
  validates :kind, :presence => true #, :length => { :minimum => 2 }  
  validates :kind_id, :presence => true #, :length => { :minimum => 2 }  
end
