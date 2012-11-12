class CreateRequestsDevolutionsComponentsDetails < ActiveRecord::Migration
  def change
    create_table :requests_devolutions_components_details do |t|
      t.string :header_id
      t.string :component_id

      t.timestamps
    end
    change_column :requests_devolutions_components_details, :id, :string, :limit => 36, :null => false
  end
end
