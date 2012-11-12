class CreateProductsCompositions < ActiveRecord::Migration
  def change
    create_table :products_compositions do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    change_column :products_compositions, :id, :string, :limit => 36, :null => false
  end
end
