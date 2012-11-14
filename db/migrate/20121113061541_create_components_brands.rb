class CreateComponentsBrands < ActiveRecord::Migration
  def change
    create_table :components_brands do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    change_column :components_brands, :id, :string, :limit => 36, :null => false
  end
end
