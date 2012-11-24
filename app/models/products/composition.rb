class Products::Composition < ActiveRecord::Base
  has_paper_trail
  attr_accessible :description, :name, :minimum_quantity, :price, :quantity
  validates :name, :presence => true #, :length => { :minimum => 2 }  
  
  validates :minimum_quantity, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }
  validates :price, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }

  has_many :details, :foreign_key => :header_id, :class_name => Products::Compositions::Detail.to_s
  
  belongs_to :status, :class_name => "Transactions::Status"

  has_many :orders_productions_details, :foreign_key => :product_id, :class_name => Orders::Productions::Detail.to_s
  
  has_many :requests_transferences_products_details, :foreign_key => :product_id, :class_name => Requests::Transferences::Products::Detail.to_s
  
  has_many :requests_devolutions_products_details, :foreign_key => :product_id, :class_name => Requests::Devolutions::Products::Detail.to_s
  
  has_many :production_stocks, :foreign_key => :product_id, :class_name => ::Stocks::Production.to_s
  
  has_many :products_stocks, :foreign_key => :product_id, :class_name => ::Stocks::Product.to_s
end
