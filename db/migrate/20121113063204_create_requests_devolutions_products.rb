class CreateRequestsDevolutionsProducts < ActiveRecord::Migration
  def change
    create_table :requests_devolutions_products do |t|
      t.string :user_id
      t.string :reason
      t.string :status_id
      t.integer :number
      
      t.timestamps
    end
    change_column :requests_devolutions_products, :id, :string, :limit => 36, :null => false
  end
end
