class CreateAclActions < ActiveRecord::Migration
  def change
    create_table :acl_actions do |t|
      t.string :name
      t.string :symbol
      t.date :deleted_at

      t.timestamps
    end
    
    change_column :acl_actions, :id, :string, :limit => 36, :null => false
  end
end
