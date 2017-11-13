# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Family.destroy_all

abdel = User.new(name: 'Abdel', email: 'abdeldubled@zozo.fr', password: 'magreb')
abdel.save!
famille_a = Family.new(name: 'gege', address: "bordeaux", price_per_day: 5, owner: abdel)
famille_a.save!

francis = User.new(name: 'Francis', email: 'saucisse@zozo.fr', password: 'porc')
francis.save!
