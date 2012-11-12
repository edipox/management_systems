class CreateComponentsModels < ActiveRecord::Migration
  def change
    create_table :components_models do |t|
      t.string :name
      t.string :description
      t.string :brand_id

      t.timestamps
    end
    change_column :components_models, :id, :string, :limit => 36, :null => false
  end
end
