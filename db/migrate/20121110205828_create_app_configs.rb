class CreateAppConfigs < ActiveRecord::Migration
  def change
    create_table :app_configs do |t|
      t.string :value
      t.date :deleted_at

      t.timestamps
    end
    
    change_column :app_configs, :id, :string, :null => false
  end
end
