puts 'Inserting initial registers in the database...'
ACL::Action.create!({ name: 'Crear', symbol: 'create' })
ACL::Action.create!({ name: 'Leer', symbol: 'read' })
ACL::Action.create!({ name: 'Editar', symbol: 'update' })
ACL::Action.create!({ name: 'Eliminar', symbol: 'delete' })

# The super user role MUST be created first!!
admin_role = ACL::Role.create!({ name: 'Administrador' })
AppConfig.create!({ id: 'admin_role_id', value: admin_role.id })

# ACL Entities
acl_entities = []
acl_entities << ['Componente', 'Components::Item']
acl_entities << ['Usuario', 'User']
acl_entities << ['Permiso de Usuario', 'ACL::Permission']
acl_entities << ['Tipo de Usuario', 'ACL::Role']
acl_entities << ['Acción de Usuario (Permisos)', 'ACL::Action']
acl_entities << ['Objeto (Permisos)', 'ACL::Entity']
acl_entities << ['Categoria de componente', 'Components::Category']
acl_entities << ['Marca de componente', 'Components::Brand']
acl_entities << ['Modelo de productos terminados', 'Products::Composition']
acl_entities << ['Estado de transacciones', 'Transactions::Status']

acl_entities << ['Orden de producción','Orders::Production']
acl_entities << ['Detalle de orden de producción','Orders::Productions::Detail']
acl_entities << ['Devolución de productos','Requests::Devolutions::Product']
acl_entities << ['Detalle de devolución de productos','Requests::Devolutions::Products::Detail']
acl_entities << ['Solicitud de componentes', 'Requests::Transferences::Component']
acl_entities << ['Detalle de solicitud de componentes','Requests::Transferences::Components::Detail']
acl_entities << ['Devolución de componentes', 'Requests::Devolutions::Component']
acl_entities << ['Detalle de devolución de componentes','Requests::Devolutions::Components::Detail']
acl_entities << ['Transferencia de productos','Requests::Transferences::Product']
acl_entities << ['Detalle de transferencia de productos','Requests::Transferences::Products::Detail']
acl_entities << ['Transferencia de componentes terminados', 'Requests::Transferences::Finished::Component']
acl_entities << ['Detalle de transferencia de componentes terminados', 'Requests::Transferences::Finished::Components::Detail']
acl_entities << ['Solicitud de compra de componentes', 'Requests::Purchases::Component']
acl_entities << ['Detalle de solicitud de compra de componentes', 'Requests::Purchases::Components::Detail']

acl_entities << ['Stock de Materia Prima','Stocks::Component']
# acl_entities << ['', '']

acl_entities.each { |e| ACL::Entity.create!({ name: e[0], const: e[1] }) }

# Special actions
stocks_component_entity = ACL::Entity.where('const = :const', { const: "Stocks::Component" }).first
stocks_component_entity.create_extra_action('Inserción inicial', :initial_insert)

keyboards = Components::Category.create!({
  name:'Teclado inalambrico',
  description:'Teclado inalambrico comun'
})

displays = Components::Category.create!({
  name:'Monitores LCD',
  description:'Monitores LCD comun'
})

brand = Components::Brand.create!({
	name:'Satellite',
	description:'Componentes en general'
})

brand2 = Components::Brand.create!({
	name:'Samsung',
	description:''
})

keyboard = Components::Item.create!({
  name:'Teclado Satellite AK701RF',
  description:'Teclado Wireless',
  code:'00245',
  minimum_quantity: 4,
  price: 70000,
  category: keyboards,
  brand: brand
})

ram = Components::Item.create!({
  name:'RAM OMRON HMC-ES551',
  description:'RAM HMC-ES551',
  code:'00300',
  minimum_quantity: 16,
  price: 40000,
  category: Components::Category.create!({
    name:'RAM DDR3',
    description:'RAM HMC-ES551'
  }),
  brand: Components::Brand.create!({
	  name:'G Skill',
	  description:'RAMs y CDs'
  })
})

mouse = Components::Item.create!({
  name:'Mouse A-F4G',
  description:'wireless mouse',
  code:'00305',
  minimum_quantity: 16,
  price: 45000,
  category: Components::Category.create!({
    name:'Mouse inalambrico',
    description:'Mouse inalambrico común'
  }),
  brand: brand
})

mother_board = Components::Item.create!({
  name:'Placamadre AP5T-3.5',
  description:'Placamadre economica',
  code:'00302',
  minimum_quantity: 3,
  price: 80000,
  category: Components::Category.create!({
    name:'Placamadre',
    description:'System Board'
  }),
  brand: Components::Brand.create!({
	  name:'Acer',
	  description:'System Board'
  })
})


display = Components::Item.create!({
  name:'Monitor LCD D550',
  description:'',
  code:'00240',
  minimum_quantity: 3,
  price: 200000,
  category: displays,
  brand: brand2
})


composition = Products::Composition.create!({
  name: 'CPU Economica',
  description: 'modelo basico de CPU economica',
  minimum_quantity: 2,
  price: 268000
})

Products::Compositions::Detail.create!({
  products_composition: composition,
  component: display,
  quantity: 1
})
Products::Compositions::Detail.create!({
  products_composition: composition,
  component: keyboard,
  quantity: 1
})
Products::Compositions::Detail.create!({
  products_composition: composition,
  component: mouse,
  quantity: 1
})
Products::Compositions::Detail.create!({
  products_composition: composition,
  component: ram,
  quantity: 2
})
Products::Compositions::Detail.create!({
  products_composition: composition,
  component: mother_board,
  quantity: 1
})

status_open = Transactions::Status.find(AppConfig.create!({
  id: 'open_status_id', 
  value: Transactions::Status.create!({ name: 'Abierta' }).id
}).value)
AppConfig.create!({
  id: 'close_status_id', 
  value: Transactions::Status.create!({ name: 'Cerrada' }).id
})
AppConfig.create!({
  id: 'reject_status_id', 
  value: Transactions::Status.create!({ name: 'Rechazada' }).id
})
Transactions::Status.create!({
  name: 'Pendiente'
})
Transactions::Status.create!({
  name: 'En curso'
})

# For test permissions creation, create a Role after a Component
employee_role = ACL::Role.create!({ name: 'Empleado' })

system_user = User.create!({
  email: 'system@site.com',
  password: 'systempass',
  password_confirmation: 'systempass',
  role: admin_role
})

AppConfig.create!({
  id: 'system_user_id', 
  value: system_user.id
})

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

# Those lines could cause an error when transactions will be properly implemented, they must be deleted
component_transaction = Stocks::Transactions::Component.create!({kind:'temp', kind_id:'temp'})
production_transaction = Stocks::Transactions::Production.create!({kind:'temp', kind_id:'temp'})

# This request should be created by the System user but it does not exist.
transference_component = Requests::Transferences::Component.create!({
  status: status_open,
  user: system_user,
  transaction: production_transaction,
})
Requests::Transferences::Components::Detail.create!({
  requests_transferences_component: transference_component,
  component: keyboard,
  quantity: 4
})

devolution_component = Requests::Devolutions::Component.create!({
  status: status_open,
  user: system_user,
  transaction: component_transaction,
  reason: 'Pedido excesivo de componentes'
})

Requests::Devolutions::Components::Detail.create!({
  requests_devolutions_component: devolution_component,
  component: ram,
  quantity: 10
})

Requests::Devolutions::Product.create!({
  transaction: Stocks::Transactions::Product.create!({kind:'temp', kind_id:'temp'}),
  user: system_user,
  reason: 'Producto funcionando incorrectamente',
  status: status_open
})
=begin
employee.role.permissions.each do |permission|
  permission.enabled = true if permission.action == 'read'
  permission.save
end
=end

## AppConfigs

app_configs = []
app_configs << [:company_name, 'Nombre de la empresa']
app_configs << [:company_address, 'Direccion de la empresa']
app_configs << [:company_telephone, '00-000000']
app_configs << [:company_cellphone, '0000-000000']
app_configs << [:company_ruc, '0000000-0']

app_configs.each {|cfg| AppConfig.create!({ id: cfg[0].to_s, value: cfg[1].to_s }) }
