class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :avatar
  has_many :like_commitments, dependent: :destroy
  has_many :commitments, through: :like_commitments, source: :commitment
  has_many :posts
  has_many :post_comments
  has_many :bravos
  has_many :bravo_posts, through: :bravos, source: :post
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  validates :account_id, presence: true, length: {maximum: 20, minimum: 1}, uniqueness: true
  validates :name, presence: true, length: {maximum: 20, minimum: 1}

  enum classification: { 一般: 0, 法人: 1}
  enum is_valid: { 有効: true, 無効: false }

  def self.search_for(account_id)
    User.where(['account_id LIKE ?', "%#{account_id}%"])
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: 'guest', account_id:'guest') do |user|
      user.password = SecureRandom.urlsafe_base64
      #user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

end
