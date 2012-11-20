class CreateStocksProducts < ActiveRecord::Migration
  def change
    create_table :stocks_products do |t|
      t.string :product_id
      t.integer :quantity
      t.integer :price
      t.timestamps
    end
    change_column :stocks_products, :id, :string, :limit => 36, :null => false
  end
end
