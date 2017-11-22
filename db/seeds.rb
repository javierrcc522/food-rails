# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Product.destroy_all
Review.destroy_all




5.times do |index|
  Product.create!(name: Faker::Food.ingredient,
                  cost: Faker::Number.number(2),
                  country_origin: 'usa')

end

50.times do |index|
  Product.create!(name: Faker::Food.ingredient,
                  cost: Faker::Number.number(2),
                  country_origin: Faker::Demographic.demonym)

end

p "Created #{Product.count} product"

250.times do |index|
  Review.create!(author: Faker::Name.first_name,
                  content_body: Faker::Lorem.sentence(20, true),
                  rating: Faker::Number.between(1, 5),
                  product_id: Faker::Number.between(Product.first.id, Product.last.id))



end

p "Created #{Review.count} review"
