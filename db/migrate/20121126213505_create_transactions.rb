class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :kind
      t.string :detail_kind
      t.string :detail_id
      t.string :from_stock
      t.string :to_stock
      t.boolean :is_component
      t.date :deleted_at

      t.timestamps
    end
    change_column :transactions, :id, :string, :limit => 36, :null => false
  end
end
