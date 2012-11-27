class CreateAccountingEntries < ActiveRecord::Migration
  def change
    create_table :accounting_entries do |t|
      t.integer :number
      t.date :date
      t.string :description

      t.timestamps
    end
    change_column :accounting_entries, :id, :string, :limit => 36, :null => false
  end
end
