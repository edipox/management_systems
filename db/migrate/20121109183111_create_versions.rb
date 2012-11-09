class CreateVersions < ActiveRecord::Migration
  def self.up
    create_table :versions do |t|
      t.string   :item_type, :null => false
      t.string   :item_id, :limit => 36, :null => false
      t.string   :event, :null => false
      t.string   :whodunnit
      t.text     :object
      t.datetime :created_at
    end
    add_index :versions, [:item_type, :item_id]
    change_column :versions, :id, :string, :limit => 36, :null => false
  end

  def self.down
    remove_index :versions, [:item_type, :item_id]
    drop_table :versions
  end
end
