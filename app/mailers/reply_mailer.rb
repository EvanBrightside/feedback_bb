class ReplyMailer < ApplicationMailer
  def reply_message(reply)
    @reply = reply

    mail(
      to: "<#{@reply.feedback.email}>",
      subject: 'New reply',
      from: "<#{@reply.current_user.email}>"
    )
  end
end
