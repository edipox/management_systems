module ACL
  class ObjectCallback
    def after_create(obj)
      @actions = %w(create read delete update)
      @object = obj

      Role.all.each { |role| p role.inspect; create_permissions_for role }
    end

    private
    def create_permissions_for(role)
      @actions.each do |action|
        p = Permission.new

        p.role_id = role.id
        p.object_id = @object.id
        p.action = action
        p.enabled = false

        p.save!
      end
    end
  end
end
