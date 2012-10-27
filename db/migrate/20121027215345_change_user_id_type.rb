class ChangeUserIdType < ActiveRecord::Migration
  def up
    change_column :users, :id, :string, :limit => 36, :null => false
  end

  def down
    change_column :user, :id, :integer
  end
end
