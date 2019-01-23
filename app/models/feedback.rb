class Feedback < ApplicationRecord
  has_one :reply, dependent: :destroy

  validates :body, presence: true
  validates :email, email: true, allow_blank: true

  after_commit :send_mail, on: :create

  private

    def send_mail
      FeedbackMailer.feedback_created(self).deliver_now
    end
end
