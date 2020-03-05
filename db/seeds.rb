# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create(email: "fjankows@student.42.us.org", uid: 47714, virtual_room: 42000, first_name: "Felix", last_name: "Jankowski", admin: true)
Compartment.create(name: "A1")
Compartment.create(name: "A2")
Compartment.create(name: "A3")
Compartment.create(name: "A4")
Compartment.create(name: "B1")
Compartment.create(name: "B2")
Compartment.create(name: "B3")
Compartment.create(name: "B4")
Compartment.create(name: "C1")
Compartment.create(name: "C2")
Compartment.create(name: "C3")
Compartment.create(name: "C4")
Compartment.create(name: "D1")
Compartment.create(name: "D2")
Compartment.create(name: "D3")
c = Compartment.create(name: "D4", active:true, returndate: Date.today + 14)
Snailmail.create(user: u, compartment: c, received_at: Time.now)