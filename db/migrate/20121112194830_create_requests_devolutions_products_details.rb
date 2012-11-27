class CreateRequestsDevolutionsProductsDetails < ActiveRecord::Migration
  def change
    create_table :requests_devolutions_products_details do |t|
      t.string :header_id
      t.string :product_id
      t.integer :quantity
      t.date :deleted_at

      t.integer :number

      t.timestamps
    end
    change_column :requests_devolutions_products_details, :id, :string, :limit => 36, :null => false
  end
end
