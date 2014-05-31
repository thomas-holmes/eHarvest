# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
agency_codes = [
  AgencyCode.create!(code: 'RJ9', description: 'Agency Type 1'),
  AgencyCode.create!(code: 'N13', description: 'Agency Type 2'),
  AgencyCode.create!(code: 'J23', description: 'Agency Type 3'),
]

locations = [
  Location.create!(code: 'A01', name: 'Doraville'),
  Location.create!(code: 'R03', name: 'Cartersville'),
  Location.create!(code: '109', name: 'Midtown'),
]

agency = Agency.create!(name: 'Test Agency', locations: locations[0,1], agency_codes: agency_codes[0,2])
User.create!(email: 'borg@test.com', password: 'password', agency: agency)

agency2 = Agency.create!(name: 'Test Agency 2', locations: locations[0,1], agency_codes: agency_codes[1,2])
User.create!(email: 'test2@test.com', password: 'password', agency: agency2)

agency3 = Agency.create!(name: 'Test Agency 3', locations: locations[0,1], agency_codes: agency_codes[2,1])
User.create!(email: 'test3@test.com', password: 'password', agency: agency3)

packaged = ItemCode.create!(code: '09', agency_codes: agency_codes[0,1])
frozen = ItemCode.create!(code: '39', agency_codes: agency_codes[0,2])
fresh = ItemCode.create!(code: 'J9', agency_codes: agency_codes[1,2])

items = [
  Item.create!(name: 'Green beans', weight: 20, quantity: 200, fee: 0.25, item_code: packaged),
  Item.create!(name: 'Kraft Macaroni & Cheese', weight: 5, quantity: 137, fee: 1.00, item_code: packaged),
  Item.create!(name: 'Chicken Breast', weight: 50, quantity: 25, fee: 10.00, item_code: frozen),
  Item.create!(name: 'Carrots', weight: 5, quantity: 87, fee: 3.00, item_code: fresh),
]

orders = [
	Order.create!(requester: "Sam", recipient: "Caroline", agency: agency, location: agency.locations.first, delivery_date: Time.now + 3.days),
	Order.create!(requester: "Sam", recipient: "Sam", agency: agency, location: agency.locations.last, delivery_date: Time.new + 5.days),
]

order1 = Order.find(1)
order1.order_items.create!(item: Item.find(1), quantity: 5, weight: 20, fee: 0.25)
order1.order_items.create!(item: Item.find(2), quantity: 39, weight: 5, fee: 1.00)


order2 = Order.find(2)
order2.order_items.create!(item: Item.find(1), quantity: 73, weight: 20, fee: 0.25)
order2.order_items.create!(item: Item.find(3), quantity: 12, weight: 50, fee: 10.00)
