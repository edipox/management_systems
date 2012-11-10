class CreateAppConfigs < ActiveRecord::Migration
  def change
    create_table :app_configs do |t|
      t.string :value

      t.timestamps
    end
    
    change_column :app_configs, :id, :string, :null => false
  end
end
