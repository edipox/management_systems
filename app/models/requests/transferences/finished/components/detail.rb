class Requests::Transferences::Finished::Components::Detail < ActiveRecord::Base

   has_paper_trail
  acts_as_paranoid

  attr_accessible :header_id, :component_id, :quantity, :component, :requests_transferences_finished_components
#  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
  
  belongs_to :requests_transferences_finished_component, :foreign_key => :solicitud_componentes_id, :class_name => Requests::Transferences::Finished::Component.to_s
  belongs_to :component, :foreign_key => :componente_id, :class_name => Components::Item.to_s 
  
  set_table_name "solicitudes_componentes_detalles"
  alias_attribute :quantity, :cantidad
  alias_attribute :component_id, :componente_id
  alias_attribute :header_id, :solicitud_componentes_id
  
  validates :solicitud_componentes_id, :presence => true #, :length => { :minimum => 2 }  
  validates :componente_id, :presence => true #, :length => { :minimum => 2 }  
  validates :cantidad, :presence => true #, :length => { :minimum => 2 }  

end
