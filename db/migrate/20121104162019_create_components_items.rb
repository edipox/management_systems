class CreateComponentsItems < ActiveRecord::Migration
  def change
    create_table :components_items do |t|
      t.string :name
      t.string :description
      t.string :code
      t.string :category

      t.timestamps
    end

    change_column :components_items, :id, :string, :limit => 36, :null => false
  end
end
