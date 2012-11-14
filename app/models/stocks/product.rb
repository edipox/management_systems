class Stocks::Product < ActiveRecord::Base
   has_paper_trail
  attr_accessible :product_id, :quantity
  validates :product_id, :presence => true, :uniqueness => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
end
