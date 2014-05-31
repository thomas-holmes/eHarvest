FactoryGirl.define do
  factory :agency_code do
    code { Faker::Lorem.characters(3) }
    description { Faker::Lorem.sentence }
  end
end
