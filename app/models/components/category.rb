class Components::Category < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :components_items, :class_name => "Components::Item"
  
  validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 2, :maximum => 100 }
  
end
