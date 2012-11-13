class Products::Composition < ActiveRecord::Base
  has_paper_trail
  attr_accessible :description, :name
  validates :name, :presence => true #, :length => { :minimum => 2 }  
  
  has_many :details, :foreign_key => :header_id, :class_name => "Products::Compositions::Detail"
  belongs_to :status, :class_name => "Transactions::Status"
end
