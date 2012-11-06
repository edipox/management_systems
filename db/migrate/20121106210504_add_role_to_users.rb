class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :acl_role_id, :string, :limit => 36
  end
end
