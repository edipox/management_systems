class Requests::Purchases::Components::Detail < ActiveRecord::Base
  acts_as_paranoid
   has_paper_trail
  attr_accessible :component_id, :header_id, :quantity, :component, :requests_purchases_component
#  validates :component_id, :presence => true
#  validates :header_id, :presence => true
#  validates :quantity, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }
  
  belongs_to :component,  :foreign_key => :componente_id, :class_name => Components::Item.to_s
  belongs_to :requests_purchases_component, :foreign_key => :pedidos_compras_componentes_id, :class_name => Requests::Purchases::Component.to_s
  
  set_table_name "pedidos_compras_componentes_detalles"
  alias_attribute :quantity, :cantidad
  alias_attribute :header_id, :pedidos_compras_componentes_id
  alias_attribute :component_id, :componentes_id
  
  validates :componente_id, :presence => true
  validates :pedidos_compras_componentes_id, :presence => true
  validates :cantidad, :presence => true, :numericality => { :greater_than => 0, :less_than => 2000000001 }
  
end
