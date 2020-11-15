class RemoveConnectNameFromConnects < ActiveRecord::Migration[5.2]
  def change
    remove_column :connects, :connect_name, :string
  end
end
