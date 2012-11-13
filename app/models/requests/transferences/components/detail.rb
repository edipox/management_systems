class Requests::Transferences::Components::Detail < ActiveRecord::Base
   has_paper_trail
  attr_accessible :component_id, :header_id, :quantity
  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
  
  #has_many :components, :class_name => "Components::Item"
  
  belongs_to :requests_transferences_component, :foreign_key => :header_id, :class_name => "Requests::Transferences::Component"
end
