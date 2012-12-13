class Components::Category < ActiveRecord::Base
  attr_accessible :description, :name, :finished
  has_many :components_items, :class_name => Components::Item.to_s
  validates :nombre, :presence => true, :uniqueness => true, :length => { :minimum => 2, :maximum => 40 }
  validates :descripcion, :length => { :maximum => 200 }
  has_paper_trail
  acts_as_paranoid
  
  set_table_name "categorias"
  
  alias_attribute :name, :nombre
  alias_attribute :description, :descripcion
  alias_attribute :finished, :vendible
end
