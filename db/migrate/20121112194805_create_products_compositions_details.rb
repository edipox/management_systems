class CreateProductsCompositionsDetails < ActiveRecord::Migration
  def change
    create_table :products_compositions_details do |t|
      t.string :component_id
      t.string :header_id
      t.integer :quantity
      t.date :deleted_at

      t.timestamps
    end
    change_column :products_compositions_details, :id, :string, :limit => 36, :null => false
  end
end
