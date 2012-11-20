class AddExtraToAclAction < ActiveRecord::Migration
  def up
    add_column :acl_actions, :extra, :boolean, :default => false
  end

  def down
    remove_column :acl_actions, :extra
  end
end
