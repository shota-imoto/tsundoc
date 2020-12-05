FactoryBot.define do
  factory :tsundoc do
    sequence(:priority_pt){ |n| 100 + n }
    status { 0 }
    secret { false }

    trait :with_book do
      association :material, :produce_book
    end
  end
end
