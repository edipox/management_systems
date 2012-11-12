class CreateOrdersProductionsDetails < ActiveRecord::Migration
  def change
    create_table :orders_productions_details do |t|
      t.string :product_id
      t.string :header_id
      t.integer :quantity

      t.timestamps
    end
    change_column :orders_productions_details, :id, :string, :limit => 36, :null => false
  end
end
