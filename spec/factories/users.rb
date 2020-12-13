FactoryBot.define do
  factory :user do
    name {"ユーザ"}
    sequence(:email) { |n| "dammy#{n}@email.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end
