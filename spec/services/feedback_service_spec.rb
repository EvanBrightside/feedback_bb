require 'rails_helper'

RSpec.describe FeedbackService, type: :service do
  let(:email) { Faker::Internet.email }
  let(:body) { Faker::Hipster.paragraph }
  let(:params) { { email: email, body: body } }
  let(:instance) { described_class.new(email: params[:email], body: params[:body]) }

  describe 'create feedback' do
    let(:balance) { 10 }

    subject { instance.call }

    context 'is valid and create feedback' do

      it { expect { subject }.to(change { Feedback.count }.by(1)) }
      it { expect { subject }.to(change { Feedback::SendEmailToAdminWorker.jobs.size }.by(1)) }
    end

    context 'email is blank' do
      let(:email) { nil }

      it { expect { subject }.to(change { Feedback.count }.by(1)) }
      it { expect { subject }.to(change { Feedback::SendEmailToAdminWorker.jobs.size }.by(1)) }
    end

    context 'email is invalid' do
      let(:email) { Faker::Hipster.name }

      it { expect { subject }.not_to(change { Feedback.count }) }
      it { expect { subject }.not_to(change { Feedback::SendEmailToAdminWorker.jobs.size }) }
    end

    context 'question is blank' do
      let(:body) { nil }

      it { expect { subject }.not_to(change { Feedback.count }) }
      it { expect { subject }.not_to(change { Feedback::SendEmailToAdminWorker.jobs.size }) }
    end
  end
end
