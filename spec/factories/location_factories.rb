FactoryGirl.define do
  factory :location do
    code { Faker::Lorem.characters(3) }
    name { Faker::Address.city }
  end
end
