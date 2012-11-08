class Components::Category < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :components_items, :class_name => "Components::Item"
  
#  validates_uniqueness_of :name
  validates_presence_of :name
  
end
