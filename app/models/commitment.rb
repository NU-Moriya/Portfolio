class Commitment < ApplicationRecord
  has_many :like_commitments, dependent: :destroy
  has_many :posts, dependent: :destroy

  def liked_by?(user)
    like_commitments.where(user_id: user.id).exists?
  end
end
