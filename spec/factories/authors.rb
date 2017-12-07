FactoryBot.define do
  factory :author do
    name "Faker::GameOfThrones.dragon"
    association :books
  end
end
