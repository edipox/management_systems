class Components::Model < ActiveRecord::Base
   has_paper_trail
  attr_accessible :brand_id, :description, :name
  validates :name, :presence => true #, :length => { :minimum => 2 }  
  validates :brand_id, :presence => true #, :length => { :minimum => 2 }  
end
