class Inquiry < ApplicationRecord
  validates :message, presence: true
end
