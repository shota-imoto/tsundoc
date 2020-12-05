FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:author) { |n| "作者#{n}" }
  end
end
