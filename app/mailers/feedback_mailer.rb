class FeedbackMailer < ApplicationMailer


  def feedback_created(feedback)
    @feedback = feedback

    emails = adm_emails.present? ? adm_emails.join(', ') : 'hello@test.ru'

    mail(
      to: emails,
      subject: 'New Feedback',
      from: "<#{@feedback.email}>"
    )
  end

  private

    def adm_emails
      User.admin_email
    end
end
