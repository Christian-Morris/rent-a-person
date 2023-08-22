# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Destroying all model data"
User.destroy_all
Occasion.destroy_all
UserOccasion.destroy_all
Availability.destroy_all
Review.destroy_all
Booking.destroy_all

puts "Creating all model data"
christian = User.create!(full_name: "Christian", age: 27, gender: "male", location: "UK", email: "cjmorris@gmail.com", password: "123456")
mark = User.create!(full_name: "Mark", age: 42, gender: "male", location: "Denmark", email: "mark@gmail.com", password: "123456")
will = User.create!(full_name: "Will", age: 30, gender: "male", location: "France", email: "will@gmail.com", password: "123456")

dinner = Occasion.create!(name: "dinner")
movie = Occasion.create!(name: "movie")
coffee = Occasion.create!(name: "coffee")
wedding = Occasion.create!(name: "wedding")
party = Occasion.create!(name: "party")
dancing = Occasion.create!(name: "dancing")
formal = Occasion.create!(name: "formal")

UserOccasion.create!(user: christian, occasion: dinner)
UserOccasion.create!(user: christian, occasion: formal)
UserOccasion.create!(user: christian, occasion: wedding)
UserOccasion.create!(user: mark, occasion: party)
UserOccasion.create!(user: mark, occasion: coffee)
UserOccasion.create!(user: mark, occasion: movie)
UserOccasion.create!(user: will, occasion: party)
UserOccasion.create!(user: will, occasion: dancing)
UserOccasion.create!(user: will, occasion: formal)

bookone = Booking.create!(occasion: movie, renter_id: christian.id, escort_id: mark.id, start_date: Date.parse("23/08/2023"), end_date: Date.parse("23/08/2023"), location: "Bali")
booktwo = Booking.create!(occasion: party, renter_id: will.id, escort_id: mark.id, start_date: Date.parse("24/08/2023"), end_date: Date.parse("25/08/2023"), location: "Bali")
bookthree = Booking.create!(occasion: dinner, renter_id: will.id, escort_id: christian.id, start_date: Date.parse("26/08/2023"), end_date: Date.parse("26/08/2023"), location: "Bali")
bookfour = Booking.create!(occasion: wedding, renter_id: mark.id, escort_id: christian.id, start_date: Date.parse("27/08/2023"), end_date: Date.parse("27/08/2023"), location: "Bali")
bookfive = Booking.create!(occasion: formal, renter_id: mark.id, escort_id: will.id, start_date: Date.parse("28/08/2023"), end_date: Date.parse("28/08/2023"), location: "Bali")
booksix = Booking.create!(occasion: dancing, renter_id: christian.id, escort_id: will.id, start_date: Date.parse("29/08/2023"), end_date: Date.parse("29/08/2023"), location: "Bali")

Review.create!(renter_id: christian.id, escort_id: mark.id, booking: bookone, comment: "Such interesting conversation about the themes post date", rating: 5)
Review.create!(renter_id: will.id, escort_id: mark.id, booking: booktwo, comment: "He made me drink farrrrr too much!", rating: 2)
Review.create!(renter_id: will.id, escort_id: christian.id, booking: bookthree, comment: "A la perfection", rating: 4)
Review.create!(renter_id: mark.id, escort_id: christian.id, booking: bookfour, comment: "Such a wondeful companion, poorly dressed though", rating: 3)
Review.create!(renter_id: mark.id, escort_id: will.id, booking: bookfive, comment: "Will could really talk business", rating: 4)
Review.create!(renter_id: christian.id, escort_id: will.id, booking: booksix, comment: "This boy has 2 left feet and now mine are sore!", rating: 3)

puts "Users created: #{User.count}"
puts "Occasions created: #{Occasion.count}"
puts "Bookings created: #{Booking.count}"
puts "Reviews created: #{Review.count}"
