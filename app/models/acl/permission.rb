class ACL::Permission < ActiveRecord::Base
  acts_as_paranoid
  attr_accessible :action_id, :entity_id, :role_id, :enabled

  attr_accessible :action, :role, :entity

  belongs_to :action, :foreign_key => :accion_id, :class_name => ACL::Action.to_s
  belongs_to :entity, :foreign_key => :entidad_id, :class_name => ACL::Entity.to_s
  belongs_to :role, :foreign_key => :rol_id, :class_name => ACL::Role.to_s

  has_paper_trail
  set_table_name "lca_permisos"
  alias_attribute :enabled, :concedido
  alias_attribute :role_id, :rol_id
  alias_attribute :entity_id, :entidad_id
  alias_attribute :action_id, :accion_id

end
