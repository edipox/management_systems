class CreateComponentes < ActiveRecord::Migration
  def change
    create_table :componentes do |t|
      t.string :nombre
      t.string :descripcion
      t.string :codigo
      t.string :categoria

      t.timestamps
    end
  end
end
