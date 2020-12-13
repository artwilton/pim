# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Container.destroy_all
Type.destroy_all
User.destroy_all

types = Type.create([
    {name: 'Building'},
    {name: 'Room'},
    {name: 'Closet'},
    {name: 'Shelving'},
    {name: 'Bin'}
])

10.times do
    name = Faker::TvShows::Buffy.unique.character
    user = User.create(
      name: name,
      email: Faker::Internet.email(name: name),
      password:'1234'
    )
end

arthur = User.create(name: 'Arthur', email: 'arthur@test.com', password: '1234')

office = arthur.containers.create(name: "Office", percent_used: 80, type_id: Type.find_by(name: "Room").id)
closet = arthur.containers.create(name: "Closet", percent_used: 95, type_id: Type.find_by(name: "Closet").id, parent_id: office.id)
shelving = arthur.containers.create(name: "Shelving Unit 1", percent_used: 75, type_id: Type.find_by(name: "Shelving").id, parent_id: closet.id)
containers = arthur.containers.create([
    {name: "Wires and Power Supplies", percent_used: 50, type_id: Type.find_by(name: "Bin").id, parent_id: shelving.id},
    {name: "Electronics, Hardware, and Spare Parts", percent_used: 50, type_id: Type.find_by(name: "Bin").id, parent_id: shelving.id},
    {name: "Office Supplies and Blank Media", percent_used: 50, type_id: Type.find_by(name: "Bin").id, parent_id: shelving.id},
    {name: "CDs and Old Videos Games", percent_used: 50, type_id: Type.find_by(name: "Bin").id, parent_id: shelving.id},
    {name: "Skate Videos", percent_used: 50, type_id: Type.find_by(name: "Bin").id, parent_id: shelving.id},
])