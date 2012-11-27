class CreateComponentsCategories < ActiveRecord::Migration
  def change
    create_table :components_categories do |t|
      t.string :name
      t.string :description
      t.boolean :finished, :default => false
      t.date :deleted_at

      t.timestamps
    end

    change_column :components_categories, :id, :string, :limit => 36, :null => false
  end
end
