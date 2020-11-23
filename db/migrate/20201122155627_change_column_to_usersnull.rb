class ChangeColumnToUsersnull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :is_valid, true
  end
end
