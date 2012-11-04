puts 'Inserting initial registers in the database...'

# The super user role MUST be created first!!
admin_role = Role.create!({ name: 'Administrador' })

ACL::Entity.create!({
  name: 'Componentes',
  const: 'Component'
})

Role.create!({ name: 'Empleado' })

User.create!({
  email: 'admin@site.com',
  password: 'contrasenha',
  password_confirmation: 'contrasenha',
  role: admin_role
})
