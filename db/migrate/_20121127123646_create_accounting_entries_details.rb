class CreateAccountingEntriesDetails < ActiveRecord::Migration
  def change
    create_table :accounting_entries_details do |t|
      t.string :account_id
      t.boolean :is_debe
      t.string :header_id
      t.integer :value

      t.timestamps
    end
    change_column :accounting_entries_details, :id, :string, :limit => 36, :null => false
  end
end
