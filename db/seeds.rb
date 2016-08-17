# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts 'Seed Destroy User'

# # User.destroy_all
require 'faker'

puts '- Seed Delete all User'

User.destroy_all


puts '- Seed Create User'

kind = %w( fridge rock underground )

10.times do
  puts '- Create new User'

  user = User.create(
    email: Faker::Internet.email,
    password: "123soleil",
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    birthdate: Date.today
  )
  if [true, false].sample
    puts '- Seed Create Cellar'
    user.cellars.create(
      description: Faker::ChuckNorris.fact,
      address: Faker::Address.city,
      space_available: Faker::Number.number(2),
      price_per_month: Faker::Number.decimal(2),
      kind: kind.sample
    )
  end
end

puts '= Seed Create User Done'
