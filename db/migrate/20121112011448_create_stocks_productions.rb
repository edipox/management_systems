class CreateStocksProductions < ActiveRecord::Migration
  def change
    create_table :stocks_productions do |t|
      t.string :component_id
      t.integer :quantity
      t.integer :price
      t.timestamps
    end
    change_column :stocks_productions, :id, :string, :limit => 36, :null => false
  end
end
