class FeedbackService
  attr_reader :body, :email

  def initialize(params)
    @body = params[:body]
    @email = params[:email]
  end

  def call
    return feedback unless feedback.save

    send_mail
    feedback
  end

  private

    def feedback
      @feedback ||= Feedback.new(body: body, email: email)
    end

    def send_mail
      Feedback::SendEmailToAdminWorker.perform_async(feedback.id)
    end
end
