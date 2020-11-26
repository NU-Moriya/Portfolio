class ChangeCulumnNameToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :account_id, :account_name
  end
end
