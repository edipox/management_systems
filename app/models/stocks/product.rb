class Stocks::Product < ActiveRecord::Base
   has_paper_trail
  attr_accessible :product_id, :quantity, :price
  validates :product_id, :presence => true #, :length => { :minimum => 2 }  
  validates :price, :presence => true
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
end
