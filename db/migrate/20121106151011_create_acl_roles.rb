class CreateAclRoles < ActiveRecord::Migration
  def change
    create_table :acl_roles do |t|
      t.string :name

      t.timestamps
    end
    
    change_column :acl_roles, :id, :string, :limit => 36, :null => false
  end
end
