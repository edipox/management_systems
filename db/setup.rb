puts 'Inserting initial registers in the database...'
ACL::Action.create!({ name: 'Crear', symbol: 'create' })
ACL::Action.create!({ name: 'Leer', symbol: 'read' })
ACL::Action.create!({ name: 'Editar', symbol: 'update' })
ACL::Action.create!({ name: 'Eliminar', symbol: 'delete' })

# The super user role MUST be created first!!
admin_role = ACL::Role.create!({ name: 'Administrador' })

# ACL Entities
acl_entities = []
acl_entities << ['Componente', 'Components::Item']
acl_entities << ['Usuario', 'User']
acl_entities << ['Permiso de Usuario', 'ACL::Permission']
acl_entities << ['Tipo de Usuario', 'ACL::Role']
acl_entities << ['Acción de Usuario (Permisos)', 'ACL::Action']
acl_entities << ['Objeto (Permisos)', 'ACL::Entity']
# acl_entities << ['', '']
# acl_entities << ['', '']
# acl_entities << ['', '']
# acl_entities << ['', '']
# acl_entities << ['', '']
# acl_entities << ['', '']
# acl_entities << ['', '']

acl_entities.each { |e| ACL::Entity.create!({ name: e[0], const: e[1] }) }

category = Components::Category.create!({
  name:'Teclado inalambrico',
  description:'Teclado inalambrico comun'
})

brand = Components::Brand.create!({
	name:'Satellite',
	description:'Componentes en general'
})

Components::Item.create!({
  name:'Teclado Satellite AK701RF',
  description:'Teclado Wireless',
  code:'00245',
  minimum_quantity: 4,
  price: 70000,
  category: category,
  brand: brand
})

# For test permissions creation, create a Role after a Component
employee_role = ACL::Role.create!({ name: 'Empleado' })

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
=begin
employee.role.permissions.each do |permission|
  permission.enabled = true if permission.action == 'read'
  permission.save
end
=end
