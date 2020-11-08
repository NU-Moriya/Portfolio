class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :commitments, :post_id, true
  end
end
