# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Family.destroy_all
User.destroy_all


puts 'Creating 16 fake Families...'



16.times do

  user = User.new(
    name: Faker::Simpsons.character,
    email: Faker::Internet.email,
    password: "12345678"
    )

  user.save!

  family = Family.new(
    name: Faker::Name.last_name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    price_per_day:(150..1000).to_a.sample,
    user_id: user[:id]
  )
  family.save!
end
puts 'Finished!'





