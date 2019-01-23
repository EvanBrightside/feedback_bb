class ReplyService
  attr_reader :message, :feedback

  def initialize(params, feedback)
    @message = params[:message]
    @feedback = feedback[:feedback]
  end

  def call
    return reply unless reply.save

    reply.feedback.update(replied: true)
    send_mail
    reply
  end

  def admin_email
    current_user.email
  end

  private

    def reply
      @reply ||= feedback.replies.build(message: message)
    end

    def send_mail
      ReplyMailer.reply_message(self).deliver_now
    end

    def current_user
      Reply.current_user
    end
end
