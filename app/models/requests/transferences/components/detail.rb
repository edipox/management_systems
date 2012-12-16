class Requests::Transferences::Components::Detail < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

  attr_accessible :component_id, :header_id, :quantity, :component, :requests_transferences_component
#  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :quantity, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }
  
  belongs_to :component, :foreign_key => :componente_id,  :class_name => Components::Item.to_s
  belongs_to :requests_transferences_component, :foreign_key => :solicitud_transferencia_componentes_id, :class_name => "Requests::Transferences::Component"
  
  set_table_name "solicitudes_transferencias_componentes_detalles"
  alias_attribute :quantity, :cantidad
  alias_attribute :header_id, :solicitud_transferencia_componentes_id
  alias_attribute :component_id, :componente_id

  validates :componente_id, :presence => true #, :length => { :minimum => 2 }  
  validates :solicitud_transferencia_componentes_id, :presence => true #, :length => { :minimum => 2 }  
  validates :cantidad, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 } 
  
  class << self
    def get_by_header_and_component component_id, header_id
     return self.where("componente_id = ? AND solicitud_transferencia_componentes_id = ?", component_id, header_id)
    end
  end 
  
  after_create :increment_quantity
  def increment_quantity
    requests_transferences_component.details.each  do |d|
      if d.component_id == component_id && d.id != id
        d.quantity += quantity
        d.save
        self.destroy
      end
    end
  end
  
end
