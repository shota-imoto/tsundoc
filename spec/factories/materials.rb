FactoryBot.define do
  factory :material do

    trait :produce_book do
      after(:create) do |material|
        create(:book, material: material)
      end
    end
  end
end
