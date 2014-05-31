FactoryGirl.define do
  factory :order do
    requester { Faker::Name.name }
    recipient { Faker::Name.name }
    delivery_date { rand(1..100).hours.from_now }
  end
end
