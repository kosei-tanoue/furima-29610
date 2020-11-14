FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    explain_item {Faker::Lorem.sentence}
    association :user
  end
end
