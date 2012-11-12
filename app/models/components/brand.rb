class Components::Brand < ActiveRecord::Base
   has_paper_trail
  attr_accessible :description, :name
  validates :name, :presence => true #, :length => { :minimum => 2 }  
end
