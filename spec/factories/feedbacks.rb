FactoryBot.define do
  factory :feedback do
    email { Faker::Internet.email }
    body { Faker::Lorem.paragraphs }
  end
end
