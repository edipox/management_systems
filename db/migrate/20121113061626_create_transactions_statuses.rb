class CreateTransactionsStatuses < ActiveRecord::Migration
  def change
    create_table :transactions_statuses do |t|
      t.string :name
      t.date :deleted_at

      t.timestamps
    end
    change_column :transactions_statuses, :id, :string, :limit => 36, :null => false
  end
end
