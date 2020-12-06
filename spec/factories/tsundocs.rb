FactoryBot.define do
  factory :tsundoc do
    sequence(:priority_pt){ |n| 100 + n }
    status { 0 }

    trait :with_book do
      association :tsundocable, factory: :book
    end

    trait :with_movie do
      association :tsundocable, factory: :movie
    end
  end
end
