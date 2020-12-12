FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "映画のタイトル#{n}" }
  end
end
