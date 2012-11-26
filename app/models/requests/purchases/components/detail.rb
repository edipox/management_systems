class Requests::Purchases::Components::Detail < ActiveRecord::Base
   has_paper_trail
  attr_accessible :component_id, :header_id, :quantity, :component, :requests_purchases_component
  validates :component_id, :presence => true
  validates :header_id, :presence => true
  validates :quantity, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }
  
  belongs_to :component, :foreign_key => :component_id, :class_name => Components::Item.to_s
  belongs_to :requests_purchases_component, :foreign_key => :header_id, :class_name => Requests::Purchases::Component
end
