class Products::Compositions::Detail < ActiveRecord::Base
  has_paper_trail
  acts_as_paranoid

  attr_accessible :component_id, :quantity, :component, :header, :products_composition
  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
  belongs_to :component, :class_name => Components::Item.to_s
  belongs_to :products_composition, :foreign_key => :header_id, :class_name => "Products::Composition"
  
  set_table_name "productos_terminados_detalles"
  alias_attribute :quantity, :cantidad
  alias_attribute :component_id, :componente_id
  alias_attribute :header_id, :producto_terminado_id
  
end
