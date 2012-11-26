class AddAclEntityIdToAclAction < ActiveRecord::Migration
  def up
    add_column :acl_actions, :entity_id, :string, :limit => 36, :null => true
  end

  def down
    remove_column :acl_actions, :entity_id
  end
end
