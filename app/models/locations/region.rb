class Locations::Region < ActiveRecord::Base
   has_paper_trail
  belongs_to :country_id
  attr_accessible :name
  validates :name, :presence => true #, :length => { :minimum => 2 }  
end
