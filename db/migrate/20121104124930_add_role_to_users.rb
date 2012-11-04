class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :string, :limit => 36
    add_foreign_key :users, :roles
  end
end
