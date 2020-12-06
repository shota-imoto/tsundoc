FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "タイトル#{n}" }
  end
end
