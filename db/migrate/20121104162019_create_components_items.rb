class CreateComponentsItems < ActiveRecord::Migration
  def change
    create_table :components_items do |t|
      t.string :name
      t.string :description
      t.string :code
      t.string :category_id
      t.integer :minimum_quantity

      t.timestamps
    end

    change_column :components_items, :id, :string, :limit => 36, :null => false
    change_column :components_items, :category_id, :string, :limit => 36, :null => false
  end
end
