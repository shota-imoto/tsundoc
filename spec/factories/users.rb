FactoryBot.define do
  factory :user do
    name {"ユーザ"}
    email {"dammy@email.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end
