class CreateLocationsContinents < ActiveRecord::Migration
  def change
    create_table :locations_continents do |t|
      t.string :name
      t.date :deleted_at

      t.timestamps
    end
    change_column :locations_continents, :id, :string, :limit => 36, :null => false
  end
end
