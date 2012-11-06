puts 'Inserting initial registers in the database...'
ACL::Action.create!({ name: 'Crear', symbol: 'create' })
ACL::Action.create!({ name: 'Leer', symbol: 'read' })
ACL::Action.create!({ name: 'Editar', symbol: 'update' })
ACL::Action.create!({ name: 'Eliminar', symbol: 'delete' })

# The super user role MUST be created first!!
admin_role = ACL::Role.create!({ name: 'Administrador' })

ACL::Entity.create!({
  name: 'Componentes',
  const: 'Components::Item'
})

# For test permissions creation, create a Role after a Component
employee_role = ACL::Role.create!({ name: 'Empleado' })
=begin
User.create!({
  email: 'admin@site.com',
  password: 'contrasenha',
  password_confirmation: 'contrasenha',
  role: admin_role
})
employee = User.create!({
  email: 'employee@site.com',
  password: 'contrasenha',
  password_confirmation: 'contrasenha',
  role: employee_role
})

employee.role.permissions.each do |permission|
  permission.enabled = true if permission.action == 'read'
  permission.save
end
=end
