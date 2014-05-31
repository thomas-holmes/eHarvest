FactoryGirl.define do
  factory :agency do
    name { Faker::Company.name }
  end
end
