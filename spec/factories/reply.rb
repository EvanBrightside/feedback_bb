FactoryBot.define do
  factory :reply do
    message { Faker::Lorem.paragraphs.join(' ') }
    feedback
  end
end
