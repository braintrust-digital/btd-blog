# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Post.create({
    title: Faker::Hipster.words(rand(2..8)),
    content: Faker::Hipster.paragraphs(rand(2..8)),
    published_at: Time.now - rand(1..20).days
  })
end
