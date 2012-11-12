class Locations::Continent < ActiveRecord::Base
   has_paper_trail
  attr_accessible :name
  validates :name, :presence => true #, :length => { :minimum => 2 }  
end
