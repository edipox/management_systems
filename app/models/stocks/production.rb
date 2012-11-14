class Stocks::Production < ActiveRecord::Base
  has_paper_trail
  attr_accessible :component_id, :quantity
  validates :component_id, :presence => true, :uniqueness => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  

  belongs_to :component, :foreign_key => :component_id, :class_name => Components::Item.to_s
end
