FactoryBot.define do
  factory :user do
    email 'admin@admin.io'
    password 'user12345'
    password_confirmation { password }
    admin true
  end
end
