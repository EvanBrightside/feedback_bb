class ReplyMailer < ApplicationMailer
  def reply_message(reply, admin_email)
    @reply = reply
    @admin_email = admin_email

    mail(
      to: "<#{@reply.feedback.email}>",
      subject: 'New reply',
      from: "<#{@admin_email}>"
    )
  end
end
