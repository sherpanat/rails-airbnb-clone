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


puts 'Creating 30 fake Families and 40 Users...'

photos = ['albinos.jpg','america.jpg','argentina.jpg', 'brazil.jpg', 'bulgaria.jpg', 'china.jpg', 'lithuania.jpg', 'mauritius.jpg', 'mongolia.jpg', 'mormon.jpg', 'pakistan.jpg', 'russia.jpg', 'singapore.jpg', 'sweden.jpg']


print 'Creating users '
10.times do
  print '👨‍ 👩 ‍👧 ‍👧 '
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "12345678"
    )

  user.save!

end
puts " done!"

250.times do
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
      photo_url: Family::URL_LIST.sample,
      country_origin: Family::COUNTRIES.sample,
      pension: %w(half-board full-board all-inclusive).sample,
      churchgoer: [true, false].sample,
      swinger: [true, false].sample,
      members: (2..10).to_a.sample
    )
    family.save!
end
puts 'Finished!'





