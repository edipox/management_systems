class Requests::Devolutions::Products::Detail < ActiveRecord::Base
   has_paper_trail
  attr_accessible :header_id, :product_id
  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
  validates :product_id, :presence => true #, :length => { :minimum => 2 }  
  
  belongs_to :requests_devolutions_product, :foreign_key => :header_id, :class_name => "Requests::Devolutions::Product"
end
