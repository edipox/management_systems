class Requests::Devolutions::Components::Detail < ActiveRecord::Base
   has_paper_trail
  attr_accessible :component_id, :header_id
  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
  
  belongs_to :requests_devolutions_component, :foreign_key => :header_id, :class_name => "Requests::Devolutions::Component"
end
