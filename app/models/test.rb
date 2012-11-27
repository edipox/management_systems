class Test < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

  attr_accessible :name
  validates :name, :presence => true #, :length => { :minimum => 2 }  
end
