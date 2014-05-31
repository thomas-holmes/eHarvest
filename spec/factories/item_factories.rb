FactoryGirl.define do
  factory :item do
    name { Faker::Commerce.product_name }
    weight { Faker::Number.decimal(2) }
    quantity { Faker::Number.number(3) }
    fee { Faker::Number.decimal(3) }
  end
end
