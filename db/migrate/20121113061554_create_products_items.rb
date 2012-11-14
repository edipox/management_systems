class CreateProductsItems < ActiveRecord::Migration
  def change
    create_table :products_items do |t|
      t.string :name
      t.string :model_id
      t.integer :minimum_quantity
      t.integer :price

      t.timestamps
    end
    change_column :products_items, :id, :string, :limit => 36, :null => false
  end
end
