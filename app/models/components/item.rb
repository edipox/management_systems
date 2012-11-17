class Components::Item < ActiveRecord::Base
  attr_accessible :category, :category_id, :code, :price, :description, :name, :minimum_quantity
  belongs_to :category, :class_name => "Components::Category"
  belongs_to :brand, :class_name => "Components::Brand"
  validates_presence_of  :code, :name, :category_id
  has_many :raw_material_stocks, :foreign_key => :component_id, :class_name => ::Stocks::Component.to_s
  has_many :production_stocks, :foreign_key => :component_id, :class_name => ::Stocks::Production.to_s
  has_paper_trail
  
  #has_many :requests_devolutions_components_details, :foreign_key => :component_id, :class_name => "Requests::Devolutions::Components::Detail"
  
end
