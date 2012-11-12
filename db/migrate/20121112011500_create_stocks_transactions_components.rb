class CreateStocksTransactionsComponents < ActiveRecord::Migration
  def change
    create_table :stocks_transactions_components do |t|
      t.string :kind
      t.string :kind_id

      t.timestamps
    end
    change_column :stocks_transactions_components, :id, :string, :limit => 36, :null => false
  end
end
