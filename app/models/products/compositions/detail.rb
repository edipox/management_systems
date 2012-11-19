class Products::Compositions::Detail < ActiveRecord::Base
  has_paper_trail
  attr_accessible :component_id, :quantity, :component, :header, :products_composition
  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
  belongs_to :component, :class_name => Components::Item.to_s
  belongs_to :products_composition, :foreign_key => :header_id, :class_name => "Products::Composition"
end
