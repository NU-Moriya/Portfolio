class CreateLikeCommitments < ActiveRecord::Migration[5.2]
  def change
    create_table :like_commitments do |t|
      t.integer :user_id
      t.integer :commitment_id

      t.timestamps
    end
  end
end
