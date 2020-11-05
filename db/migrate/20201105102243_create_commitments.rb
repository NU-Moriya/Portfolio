class CreateCommitments < ActiveRecord::Migration[5.2]
  def change
    create_table :commitments do |t|
      t.integer :post_id, null: false
      t.string :room_name, null: false
      
      t.timestamps
    end
  end
end
