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

  validates :account_name, presence: true,  length: {maximum: 20, minimum: 1}
  validates_uniqueness_of :account_name, :case_sensitive => true
  validates :name, presence: true, length: {maximum: 20, minimum: 1}
  validates :email, presence: true, uniqueness: true


  enum classification: { 一般: 0, 法人: 1}
  enum is_valid: { 有効: true, 無効: false }

  def self.search_for(account_name)
    User.where(['account_name LIKE ?', "%#{account_name}%"])
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: 'guest', account_name:'guest') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end


end
