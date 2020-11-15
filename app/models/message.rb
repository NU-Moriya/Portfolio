class Message < ApplicationRecord

  belongs_to :user
  belongs_to :connect
  validates :content, presence: true
end
