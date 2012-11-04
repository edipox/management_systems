puts 'Inserting initial registers in the database...'

# The super user role MUST be created first!!
admin_role = Role.create!({ name: 'Administrador' })

ACL::Entity.create!({
  name: 'Componentes',
  const: 'Component'
})

# For test permissions creation, create a Role after a Component
employee_role = Role.create!({ name: 'Empleado' })

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
