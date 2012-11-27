class CreateStocksProductions < ActiveRecord::Migration
  def change
    create_table :stocks_productions do |t|
      t.string :component_id
      t.integer :component_quantity
      t.integer :component_price
      
      t.string :product_id
      t.integer :product_quantity
      t.integer :product_price      

      t.date :deleted_at
      t.timestamps
    end
    change_column :stocks_productions, :id, :string, :limit => 36, :null => false
  end
end
