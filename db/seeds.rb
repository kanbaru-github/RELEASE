# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# # Admin.create!(
# #   email: "admin@test.com",
# #   password: "000000"
# #   )

# # Customer.create!(
# #   email: "customer@test.com",
# #   is_active: true,
# #   password: "111111"
# #   )


# Category.create!(
#   [
#     {
#       name: "ポジティブ",
#     },
#     {
#       name: "ネガティブ",
#     },
#     {
#       name: "その他",
#     }
#   ]
#   )

Post.create!(
  customer_id: 1,
  category_id: 1,
  image: File.open("./app/assets/images/test.jpeg"),
  text: "test"
  )