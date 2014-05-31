require 'csv'

desc "Add items from csv"
task :items => :environment do
  CSV.foreach('lib/assets/data.csv') do |row|
    codes = ItemCode.all.to_a
    Item.create!(name: row[1], quantity: Faker::Number.number(3), weight: Faker::Number.decimal(2), fee: row[7], item_code: codes.sample)
  end
end
