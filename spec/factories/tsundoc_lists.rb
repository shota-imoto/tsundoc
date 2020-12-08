FactoryBot.define do
  factory :tsundoc_list do
    trait :with_user do
      association:user
    end
  end
end
