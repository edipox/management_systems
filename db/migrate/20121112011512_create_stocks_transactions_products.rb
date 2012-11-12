class CreateStocksTransactionsProducts < ActiveRecord::Migration
  def change
    create_table :stocks_transactions_products do |t|
      t.string :kind
      t.string :kind_id

      t.timestamps
    end
    change_column :stocks_transactions_products, :id, :string, :limit => 36, :null => false
  end
end
