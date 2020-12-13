# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

types = Type.create([
    {name: 'Building', default: true},
    {name: 'Room', default: true},
    {name: 'Closet', default: true},
    {name: 'Shelving', default: true},
    {name: 'Bin', default: true}
])

10.times do
    name = Faker::TvShows::Buffy.unique.character
    user = User.create(
      name: name,
      email: Faker::Internet.email(name: name),
      password:'1234'
    )
end

admin = User.create(name: 'admin', email: 'admin@pim.com', password: '1234', admin: true )
arthur = User.create(name: 'Arthur', email: 'arthur@test.com', password: '1234', admin: false )

office = arthur.containers.create(name: "Office", percent_used: 80, type_id: Type.find_by(name: "Room").id)
closet = arthur.containers.create(name: "Closet", percent_used: 95, type_id: Type.find_by(name: "Closet").id, parent_id: office.id)
shelving = arthur.containers.create(name: "Shelving Unit 1", percent_used: 75, type_id: Type.find_by(name: "Shelving").id, parent_id: closet.id)
containers = arthur.containers.create([
    {name: "Bin 1", percent_used: 50, type_id: Type.find_by(name: "Bin").id, parent_id: shelving.id, barcode: Faker::Barcode.upc_a},
    {name: "Bin 2", percent_used: 50, type_id: Type.find_by(name: "Bin").id, parent_id: shelving.id, barcode: Faker::Barcode.upc_a},
    {name: "Bin 3", percent_used: 50, type_id: Type.find_by(name: "Bin").id, parent_id: shelving.id, barcode: Faker::Barcode.upc_a},
    {name: "Bin 4", percent_used: 50, type_id: Type.find_by(name: "Bin").id, parent_id: shelving.id, barcode: Faker::Barcode.upc_a},
    {name: "Bin 5", percent_used: 50, type_id: Type.find_by(name: "Bin").id, parent_id: shelving.id, barcode: Faker::Barcode.upc_a},
])

categories = Category.create([
    {name: 'Electronics', default: true},
    {name: 'Clothing', default: true},
    {name: 'Audio/Video Equipment', default: true},
    {name: 'Tools', default: true},
    {name: 'Video Games', default: true}
])

50.times do
    arthur.items.create(name: Faker::Commerce.unique.product_name, container_id: containers.sample.id, category_id: categories.sample.id)
end