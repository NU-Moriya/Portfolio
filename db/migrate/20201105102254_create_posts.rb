class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :commitment_id, null: false
      t.text :content, null: false
      t.string :image_id
      t.timestamps
    end
  end
end
