class CreateAclEntities < ActiveRecord::Migration
  def change
    create_table :acl_entities do |t|
      t.string :name
      t.string :const
      t.date :deleted_at

      t.timestamps
    end

    change_column :acl_entities, :id, :string, :limit => 36, :null => false
  end
end
