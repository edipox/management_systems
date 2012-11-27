class CreateRequestsPurchasesComponents < ActiveRecord::Migration
  def change
    create_table :requests_purchases_components do |t|
      t.string :status_id
      t.string :user_id
      t.integer :number
      
      t.timestamps
    end
    change_column :requests_purchases_components, :id, :string, :limit => 36, :null => false
  end
end
