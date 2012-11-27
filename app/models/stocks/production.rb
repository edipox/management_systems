class Stocks::Production < ActiveRecord::Base
  has_paper_trail
  acts_as_paranoid

  attr_accessible :component_id, :component_quantity, :component_price, :product_id, :product_quantity, :product_price
  #validates :component_id, :presence => true #, :length => { :minimum => 2 }
  #validates :product_id, :presence => true #, :length => { :minimum => 2 }      
  #validates :coquantity, :presence => true #, :length => { :minimum => 2 }  
  #validates :price, :presence => true
  belongs_to :component, :foreign_key => :component_id, :class_name => Components::Item.to_s
  belongs_to :product, :foreign_key => :product_id, :class_name => Products::Composition.to_s  
end
