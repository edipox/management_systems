class CreateRequestsTransferencesProducts < ActiveRecord::Migration
  def change
    create_table :requests_transferences_products do |t|
      t.string :status_id
      t.string :user_id
      t.integer :number
      
      t.timestamps
    end
    change_column :requests_transferences_products, :id, :string, :limit => 36, :null => false
  end
end
