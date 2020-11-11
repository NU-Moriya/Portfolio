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
end
