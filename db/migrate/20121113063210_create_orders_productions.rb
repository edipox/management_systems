class CreateOrdersProductions < ActiveRecord::Migration
  def change
    create_table :orders_productions do |t|
      t.string :transaction_id
      t.string :status_id
      t.string :user_id

      t.timestamps
    end
    change_column :orders_productions, :id, :string, :limit => 36, :null => false
  end
end
