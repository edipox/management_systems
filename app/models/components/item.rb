class Components::Item < ActiveRecord::Base
  attr_accessible :category, :category_id, :code, :description, :name
  belongs_to :category, :class_name => "Components::Category"
  
  validates_presence_of  :code, :name, :category_id

  has_many :stocks, :foreign_key => :component_id, :class_name => ::Stocks::Component.to_s

  has_paper_trail
end
