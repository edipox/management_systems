class ACL::Action < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :name, :symbol, :extra

  has_many :acl_permissions, :foreign_key => :accion_id,:class_name => ACL::Permission.to_s

  attr_accessible :entity, :entity_id
  belongs_to :entity, :foreign_key => :entidad_id, :class_name => ACL::Entity.to_s

  has_paper_trail
  
  set_table_name "lca_acciones"
  alias_attribute :name, :nombre
  alias_attribute :symbol, :simbolo
  alias_attribute :entity_id, :entidad_id
  alias_attribute :permissions, :acl_permissions
end
