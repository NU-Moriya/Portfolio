class CreateConnects < ActiveRecord::Migration[5.2]
  def change
    create_table :connects do |t|
      t.string :connect_name, null: false
      t.timestamps
    end
  end
end
