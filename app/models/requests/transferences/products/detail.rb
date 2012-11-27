class Requests::Transferences::Products::Detail < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

  attr_accessible :header_id, :product_id, :quantity, :product, :requests_transferences_product
  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
  validates :product_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
  
  belongs_to :requests_transferences_product, :foreign_key => :header_id, :class_name => Requests::Transferences::Product.to_s
  belongs_to :product, :foreign_key => :product_id, :class_name => Products::Composition.to_s 
end
