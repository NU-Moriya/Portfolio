class Post < ApplicationRecord

  belongs_to :user
  belongs_to :commitment
  has_many :bravos, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  attachment :image
end
