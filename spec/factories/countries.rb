FactoryBot.define do
  factory :country do
    name { Faker::Address.unique.country }
    group
  end
end
