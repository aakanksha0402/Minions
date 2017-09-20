# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.destroy_all

10.times do
  title = Faker::StarWars.planet
  page_number = Faker::Number.number(2)
  book = Book.create(
    :title => title,
    :page_number => page_number,
    :type => Book.types.keys.sample
  )

  name = Faker::GameOfThrones.character
  author = Author.create( name: name )

end
