# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Family.destroy_all
User.destroy_all


puts 'Creating 20 fake Families and 30 Users...'

photos = ['chinese.jpg','pakistani.jpg','enculepapa.jpg', 'albinos.jpg', 'mormon.jpg']
countries = ['China', 'Pakistan', 'Australia', 'India', 'United States']

10.times do

  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "12345678"
    )

  user.save!

end

7.times do
  photos.each_with_index do |p, i|

    user = User.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: "12345678"
      )

    user.save!

    family = Family.new(
      name: user[:last_name],
      city: Faker::Address.city,
      price_per_day:(15..100).to_a.sample,
      user_id: user[:id],
      photo: photos[i],
      country_origin: countries[i]
    )
    family.save!
  end
end
puts 'Finished!'





