class Stocks::Component < ActiveRecord::Base
  has_paper_trail
  attr_accessible :component_id, :quantity, :price
  attr_accessible :component
  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
  validates :price, :presence => true

  belongs_to :component, :foreign_key => :component_id, :class_name => Components::Item.to_s
end
