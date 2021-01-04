require "down"
require 'net/http'
require 'json'

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
    url = 'https://loremflickr.com/json/300/300/household,items/all'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    item = arthur.items.create(name: Faker::Commerce.unique.product_name, container_id: containers.sample.id, category_id: categories.sample.id)
    image = Down.download(data['file'])
    item.photo.attach(io: image, filename: "image.jpg")
end