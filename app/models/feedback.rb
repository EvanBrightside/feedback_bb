class Feedback < ApplicationRecord
  has_many :replies, dependent: :destroy

  validates :body, presence: true
  validates :email, email: true, allow_blank: true
end
