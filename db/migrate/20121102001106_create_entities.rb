class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :const

      t.timestamps
    end

    change_column :entities, :id, :string, :limit => 36, :null => false
  end
end
