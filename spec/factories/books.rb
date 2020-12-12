FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "本のタイトル#{n}" }
    sequence(:author) { |n| "本の作者#{n}" }
  end
end
