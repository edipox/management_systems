class Components::Item < ActiveRecord::Base
  attr_accessible :category, :category_id, :code, :description, :name, :minimum_quantity
  belongs_to :category, :class_name => "Components::Category"
  
  validates_presence_of  :code, :name, :category_id
  has_paper_trail
  
  #has_many :requests_devolutions_components_details, :foreign_key => :component_id, :class_name => "Requests::Devolutions::Components::Detail"
  
end
