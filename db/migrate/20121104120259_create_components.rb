class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name, :null => false
      t.string :description
      t.string :code, :null => false
      t.string :category, :null => false

      t.timestamps
    end
  end
end
