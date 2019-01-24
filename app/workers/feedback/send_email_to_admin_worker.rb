class Feedback::SendEmailToAdminWorker
  include Sidekiq::Worker

  def perform(id)
    feedback = Feedback.find(id)
    FeedbackMailer.feedback_created(feedback).deliver_later
  end
end
