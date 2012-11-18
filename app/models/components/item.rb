class Components::Item < ActiveRecord::Base
  attr_accessible :brand, :brand_id, :category, :category_id, :code, :price, :description, :name, :minimum_quantity
  belongs_to :category, :class_name => Components::Category.to_s
  belongs_to :brand, :class_name => Components::Brand.to_s
  validates_presence_of  :code, :name, :category_id, :brand_id, :minimum_quantity, :price
  has_many :raw_material_stocks, :foreign_key => :component_id, :class_name => ::Stocks::Component.to_s
  has_many :production_stocks, :foreign_key => :component_id, :class_name => ::Stocks::Production.to_s
  has_paper_trail
  
  has_many :requests_transferences_components_detail, :class_name => Requests::Transferences::Components::Detail.to_s
  
  has_many :requests_devolutions_components_detail, :class_name => Requests::Devolutions::Components::Detail.to_s
  
  has_many :products_compositions_detail, :class_name => Products::Compositions::Detail.to_s
  #has_many :requests_devolutions_components_details, :foreign_key => :component_id, :class_name => "Requests::Devolutions::Components::Detail"
  
end
