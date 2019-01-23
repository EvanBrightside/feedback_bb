require 'rails_helper'

RSpec.describe Feedback, type: :model do
  describe '#send_mail' do

    context 'on create' do
      subject { create :feedback }

      it 'sends an email', :mailer do
        expect{ subject }.to change { ActionMailer::Base.deliveries.count }.by(1)
      end

    end
  end
end
