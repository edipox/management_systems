class CreateLocationsCities < ActiveRecord::Migration
  def change
    create_table :locations_cities do |t|
      t.string :name
      t.references :region_id
      t.date :deleted_at

      t.timestamps
    end
    add_index :locations_cities, :region_id_id
    change_column :locations_cities, :id, :string, :limit => 36, :null => false
  end
end
