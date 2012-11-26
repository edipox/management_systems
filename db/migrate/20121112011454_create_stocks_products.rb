class CreateStocksProducts < ActiveRecord::Migration
  def change
    create_table :stocks_products do |t|
      t.string :component_id
      t.integer :component_quantity
      t.integer :component_price
      
      t.string :product_id
      t.integer :product_quantity
      t.integer :product_price    
      t.timestamps
    end
    change_column :stocks_products, :id, :string, :limit => 36, :null => false
  end
end
