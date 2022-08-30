# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Halka.create([{ name: 'NA-56' },
  { name: 'NA-57' },
  { name: 'NA-60' },
  { name: 'NA-85' },
  { name: 'NA-86' },
  { name: 'NA-87' },
  { name: 'NA-102' },
  { name: 'NA-115' },
  { name: 'NA-117' },
  { name: 'NA-120' },
  { name: 'NA-152' },
  { name: 'NA-156' },
  { name: 'NA-187' }])

# 100.times do |_i|
#   user = User.new(
#     name: Faker::Name.name,
#     password: 'asdasd',
#     email: Faker::Internet.email,
#     cnic: Faker::Base.numerify('#####-#######-#'),
#     halka_id: Faker::Number.between(from: 1, to: 13)
#   )
#   img_name = "img#{rand(1...5)}.jpg"
#   user.avatar.attach(
#     io: File.open(Rails.root.join("app/assets/images/#{img_name}")),
#     filename: img_name,
#     content_type: 'image/jpg'
#   )
#   user.save!
# end


user = User.new(name: 'Ahmad Amin', password: 'asdasd', email: 'baigahmad323@gmail.com', cnic: '33100-4979893-7', halka_id: 1)
user.save
