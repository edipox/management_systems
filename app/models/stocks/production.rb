class Stocks::Production < ActiveRecord::Base
   has_paper_trail
  attr_accessible :component_id, :quantity
  validates :component_id, :presence => true, :uniqueness => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
end
