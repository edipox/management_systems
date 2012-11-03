Role.all.each { |r| r.delete }

r = Role.new
r.name = 'Adminitrador'
r.save!

obj = RoleObject.new
obj.name = 'Componentes'
obj.const = 'Components'
obj.save!




