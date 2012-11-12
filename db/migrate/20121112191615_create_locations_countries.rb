class CreateLocationsCountries < ActiveRecord::Migration
  def change
    create_table :locations_countries do |t|
      t.string :name
      t.references :continent_id

      t.timestamps
    end
    add_index :locations_countries, :continent_id_id
    change_column :locations_countries, :id, :string, :limit => 36, :null => false
  end
end
