class CreateRequestsPurchasesComponentsDetails < ActiveRecord::Migration
  def change
    create_table :requests_purchases_components_details do |t|
      t.string :header_id
      t.string :component_id
      t.integer :quantity

      t.timestamps
    end
    change_column :requests_purchases_components_details, :id, :string, :limit => 36, :null => false
  end
end
