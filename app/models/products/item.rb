class Products::Item < ActiveRecord::Base
   has_paper_trail
  attr_accessible :minimum_quantity, :model_id, :name, :price, :quantity
  validates :name, :presence => true #, :length => { :minimum => 2 }  
  validates :model_id, :presence => true #, :length => { :minimum => 2 }  
  validates :minimum_quantity, :presence => true #, :length => { :minimum => 2 }  
  validates :price, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
end
