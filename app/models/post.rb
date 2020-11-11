class Post < ApplicationRecord

  belongs_to :user
  belongs_to :commitment
  has_many :bravos, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  attachment :image
  
  def bravo_by?(user)
    bravos.where(user_id: user.id).exists?
  end
  
  def self.search_for(content, commitment)
    #postに対して先にcommitment_idで絞って、その後にキーワードの文字列検索
    Post.where(commitment_id: commitment).where(['content LIKE ?', "%#{content}%"])
  end
end
