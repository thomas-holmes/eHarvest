desc "Generate orders"
task :orders => :environment do

  agency = Agency.first
  locations = Location.all.to_a
  items = Item.all
  (1..10).each do |i|
    order = Order.create!(requester: Faker::Name.name, recipient: Faker::Name.name, agency: agency, location: locations.sample, delivery_date: rand(1..5).days.from_now)
    (1..5).each do |j|
      item = items.sample
      order.order_items.create!(item: item, quantity: rand(1..item.quantity.to_i), weight: item.weight, fee: item.fee)
    end
  end
end
