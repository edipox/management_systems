class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name

      t.timestamps
    end
    change_column :tests, :id, :string, :limit => 36, :null => false
  end
end
