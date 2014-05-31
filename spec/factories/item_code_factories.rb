FactoryGirl.define do
  factory :item_code do
    code { Faker::Lorem.characters(3) }
  end
end
