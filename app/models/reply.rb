class Reply < ApplicationRecord
  cattr_accessor :current_user

  validates :message, presence: true

  belongs_to :feedback, required: true

  after_commit :send_mail, on: :create

  private
    def send_mail
      ReplyMailer.reply_message(self).deliver_now
    end
end
