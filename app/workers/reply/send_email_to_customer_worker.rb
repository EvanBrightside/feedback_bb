class Reply::SendEmailToCustomerWorker
  include Sidekiq::Worker

  def perform(id, admin_email)
    reply = Reply.find(id)

    ReplyMailer.reply_message(reply, admin_email).deliver_later
  end
end
