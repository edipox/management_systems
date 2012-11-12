class CreateComponentsCategoriesKinds < ActiveRecord::Migration
  def change
    create_table :components_categories_kinds do |t|
      t.string :name

      t.timestamps
    end
    change_column :components_categories_kinds, :id, :string, :limit => 36, :null => false
  end
end
