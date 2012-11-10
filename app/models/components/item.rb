class Components::Item < ActiveRecord::Base
  attr_accessible :category, :category_id, :code, :description, :name
  belongs_to :category, :class_name => "Components::Category"
  
  validates_presence_of  :code, :name

  has_paper_trail
end
