class Requests::Devolutions::Components::Detail < ActiveRecord::Base
  has_paper_trail
  acts_as_paranoid

  attr_accessible :component_id, :header_id, :quantity, :component, :requests_devolutions_component
#  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :quantity, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }#, :length => { :minimum => 2 }   
  belongs_to :requests_devolutions_component, :foreign_key => :devoluciones_componentes_id, :class_name => "Requests::Devolutions::Component"
  belongs_to :component, :foreign_key => :componente_id,  :class_name => Components::Item.to_s
  
  set_table_name "devoluciones_componentes_detalles"
  alias_attribute :quantity, :cantidad
  alias_attribute :header_id, :devoluciones_componentes_id
  alias_attribute :component_id, :componente_id

  validates :devoluciones_componentes_id, :presence => true #, :length => { :minimum => 2 }  
  validates :componente_id, :presence => true #, :length => { :minimum => 2 }  
  validates :cantidad, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }
  
  after_create :increment_quantity
  def increment_quantity
    requests_devolutions_component.details.each  do |d|
      if d.component_id == component_id && d.id != id
        d.quantity += quantity
        d.save
        self.destroy
      end
    end
  end

  
end
