module ACL
  class PermissionsGenerator
    def self.generate(role, entity, enabled = false, actions = nil)
      actions ||= Action.where('extra is false')
      ## extra actions
      #Action.where('entity_id = :id', { id: entity.id }).each { |action| actions << action }
      Action.where('entidad_id = :id', { id: entity.id }).each { |action| actions << action }

      actions.each do |action|
        #Permission.where('role_id = :role and entity_id = :entity and action_id = :action', {
        Permission.where('rol_id = :role and entidad_id = :entity and accion_id = :action', {
          role: role.id,
          entity: entity.id,
          action: action.id
        }).each do |permission|
          action = nil
        end

        Permission.create!({
          role: role,
          entity: entity,
          action: action,
          enabled: enabled
        }) unless action.nil?
      end
    end
  end
end
