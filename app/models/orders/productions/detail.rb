class Orders::Productions::Detail < ActiveRecord::Base
   has_paper_trail
  attr_accessible :header_id, :product_id, :quantity, :product
  validates :product_id, :presence => true #, :length => { :minimum => 2 }  
  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  

  belongs_to :product, :foreign_key => :product_id, :class_name => Products::Composition.to_s  
  
  belongs_to :orders_production, :foreign_key => :header_id, :class_name => Orders::Production.to_s
end
