FactoryBot.define do
  factory :tsundoc do
    transient { user { User.new } }

    sequence(:priority_pt){ |n| 100 + n }
    status { 0 }

    trait :with_book do
      association :tsundocable, factory: :book
    end

    trait :with_movie do
      association :tsundocable, factory: :movie
    end

    trait :with_book_tag do
      after(:create) do |tsundoc, e|
        tag = FactoryBot.create(:tag, :for_book, user: e.user)
        FactoryBot.create(:tagging, tsundoc: tsundoc, tag: tag)
      end
    end

    trait :with_movie_tag do
      after(:create) do |tsundoc, e|
        tag = FactoryBot.create(:tag, :for_movie, user: e.user)
        FactoryBot.create(:tagging, tsundoc: tsundoc, tag: tag)
      end
    end
  end
end
