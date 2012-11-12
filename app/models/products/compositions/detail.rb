class Products::Compositions::Detail < ActiveRecord::Base
   has_paper_trail
  attr_accessible :components_id, :composition_id, :quantity
  validates :composition_id, :presence => true #, :length => { :minimum => 2 }  
  validates :components_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
  
  belongs_to :products_composition, :foreign_key => :header_id, :class_name => "Products::Composition"
end
