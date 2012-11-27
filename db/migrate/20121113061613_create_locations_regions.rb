class CreateLocationsRegions < ActiveRecord::Migration
  def change
    create_table :locations_regions do |t|
      t.string :name
      t.references :country_id
      t.date :deleted_at

      t.timestamps
    end
    add_index :locations_regions, :country_id_id
    change_column :locations_regions, :id, :string, :limit => 36, :null => false
  end
end
