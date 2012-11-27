class CreateAclPermissions < ActiveRecord::Migration
  def change
    create_table :acl_permissions do |t|
      t.string :role_id
      t.string :entity_id
      t.string :action_id
      t.boolean :enabled
      t.date :deleted_at

      t.timestamps
    end

    change_column :acl_permissions, :id, :string, :limit => 36, :null => false
  end
end
