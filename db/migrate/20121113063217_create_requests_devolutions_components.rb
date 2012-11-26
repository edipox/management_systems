class CreateRequestsDevolutionsComponents < ActiveRecord::Migration
  def change
    create_table :requests_devolutions_components do |t|
      t.string :status_id
      t.string :user_id
      t.string :reason
      t.integer :number

      t.timestamps
    end
    change_column :requests_devolutions_components, :id, :string, :limit => 36, :null => false
  end
end
