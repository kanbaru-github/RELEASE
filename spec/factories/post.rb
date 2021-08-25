FactoryBot.define do
  factory :post do
    text { Faker::Lorem.characters(number: 5) }
    customer
  end
end
