class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name

      t.timestamps
    end

    change_column :roles, :id, :string, :limit => 36, :null => false
  end
end
