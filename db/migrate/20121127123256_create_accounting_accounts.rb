class CreateAccountingAccounts < ActiveRecord::Migration
  def change
    create_table :accounting_accounts do |t|
      t.string :name
      t.boolean :entrable

      t.timestamps
    end
    change_column :accounting_accounts, :id, :string, :limit => 36, :null => false
  end
end
