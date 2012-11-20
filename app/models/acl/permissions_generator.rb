module ACL
  class PermissionsGenerator
    def self.generate(role, entity, enabled = false, actions = nil)
      actions ||= Action.all
      actions.each do |action|
        Permission.create!({
          role: role,
          entity: entity,
          action: action,
          enabled: enabled
        })
      end
    end
  end
end
