FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| "タグ#{n}" }

    trait :for_book do
      type { "BookTag" }
    end

    trait :for_movie do
      type { "MovieTag" }
    end

    trait :with_user do
      association :user
    end
  end
end
