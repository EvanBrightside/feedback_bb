require 'rails_helper'

RSpec.describe FeedbackMailer, type: :mailer do
  describe 'instructions' do
    feedback = FactoryBot.build(:mail)
    let(:mail) { described_class.feedback_created(feedback).deliver_now }

    it 'renders the subject' do
      expect(feedback.subject).to eq('New Feedback')
    end

    it 'renders the receiver email' do
      expect(feedback.to).to eq(['hello@gmail.com'])
    end

    it 'renders the sender email' do
      expect(feedback.from).to eq(['xvanx84@gmail.com'])
    end

    it 'assigns body text' do
      expect(feedback.body.encoded).to match(feedback.body)
    end
  end
end
