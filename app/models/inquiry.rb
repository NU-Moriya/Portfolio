class Inquiry < ApplicationRecord
  validates :message, presence: true
  validates :name, presence: true
end
