class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :nombre
      t.string :descripcion
      t.string :codigo
      t.string :categoria

      t.timestamps
    end
  end
end
