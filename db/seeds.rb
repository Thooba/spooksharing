require "open-uri"
User.destroy_all
Book.destroy_all

addresses = [
  "Rudi-Dutschke-Straße 26, 10969 Berlin",
  "Suarezstrasse 20, 10115 Berlin",
  "25 Zwickauer Damm, 12353 Berlin",
  "33 B Büchsenweg, 13409 Berlin",
  "13 Pestalozzistraße, 12557 Berlin",
  "58 Hochkönigweg, 12349 Berlin",
  "64 Cosmarweg, 13591 Berlin",
  "78 Ruppiner Chaussee, 13503 Berlin",
  "16 Bahnhofstrasse, 13159 Berlin",
  "4 Woelckpromenade, 13086 Berlin"
]

photos = [
  "app/assets/images/Beloved.jpg",
  "app/assets/images/Dracula.jpg",
  "app/assets/images/Frankenstein.jpg",
  "app/assets/images/Ghost_Story.jpg",
  "app/assets/images/Head.jpg",
  "app/assets/images/Hill_House.jpg",
  "app/assets/images/House_of_leaves.jpg",
  "app/assets/images/IT.jpg",
  "app/assets/images/Little_Stranger.jpg",
  "app/assets/images/The_Shining.jpg"
]

user1 = User.create(
  firstname: Faker::Name.first_name,
  email: "test@test.com",
  password: "123456"
)

addresses.each_with_index do |address, index|
  book = Book.new(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: ["horror", "love", "comedy", "sci-fi"].sample,
    synopsis: Faker::Books::Lovecraft.sentence(word_count: 25, random_words_to_add: 10),
    release_date: Faker::Date.between(from: '1900-09-23', to: '2023-02-25'),
    address: address
  )
  file = URI.open(photos[index])
  book.photo.attach(io: file, filename: "book#{index}.jpg", content_type: "image/jpg")
  book.user = user1
  book.save!
  puts "book number #{index} created"
end
