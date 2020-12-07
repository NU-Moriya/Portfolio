class Commitment < ApplicationRecord
  has_many :like_commitments, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :room_name, presence: true

  def liked_by?(user)
    like_commitments.where(user_id: user.id).exists?
  end

  def self.search_for(content)
    Commitment.where(['room_name LIKE ?', "%#{content}%"])
  end
end
