# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Book.destroy_all

10.times do

User.create(
  firstname: Faker::Name.first_name
)

  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: ["horror", "love", "comedy", "sci-fi"].sample,
    synopsis: Faker::Books::Lovecraft.sentence,
    release_date: Faker::Date.between(from: '1900-09-23', to: '2023-02-25'),
    user_id: User.all.sample.id,
  )
end
