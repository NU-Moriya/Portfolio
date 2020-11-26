class ChangeCulumnNameToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :account_name, :account_name
  end
end
