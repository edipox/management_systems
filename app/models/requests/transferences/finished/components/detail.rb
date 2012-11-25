class Requests::Transferences::Finished::Components::Detail < ActiveRecord::Base

   has_paper_trail
  attr_accessible :header_id, :component_id, :quantity, :component, :requests_transferences_finished_components
  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
  
  belongs_to :requests_transferences_finished_component, :foreign_key => :header_id, :class_name => Requests::Transferences::Finished::Component.to_s
  belongs_to :component, :foreign_key => :component_id, :class_name => Components::Item.to_s 
  
end
