RSpec.configure do |config|
  config.before :each, mailer: true do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  config.after :each, mailer: true do
    ActionMailer::Base.deliveries.clear
  end
end
