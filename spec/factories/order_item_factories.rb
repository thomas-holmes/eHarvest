FactoryGirl.define do
  factory :order_item do
    quantity { Faker::Number.number(2) }
    fee { Faker::Number.decimal(2) }
    weight { Faker::Number.decimal(3) }
  end
end
