class CreateStocksTransactionsProductions < ActiveRecord::Migration
  def change
    create_table :stocks_transactions_productions do |t|
      t.string :kind
      t.string :kind_id

      t.timestamps
    end
    change_column :stocks_transactions_productions, :id, :string, :limit => 36, :null => false
  end
end
