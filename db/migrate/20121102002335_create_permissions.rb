class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :role_id, :limit => 36
      t.string :entity_id, :limit => 36
      t.string :action
      t.boolean :enabled

      t.timestamps
    end

    change_column :permissions, :id, :string, :limit => 36, :null => false
  end
end
