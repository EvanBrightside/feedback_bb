class Feedback < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_one :reply, dependent: :destroy

  validates :body, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, allow_blank: true

  after_commit :send_mail, on: :create

  #private

    def send_mail
      FeedbackMailer.feedback_created(self).deliver_now
    end
end
