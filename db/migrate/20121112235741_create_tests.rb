class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.date :deleted_at

      t.timestamps
    end
    change_column :tests, :id, :string, :limit => 36, :null => false
  end
end
