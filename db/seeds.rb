# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting all previous seed files..."

Perk.delete_all

puts "All previous seeds deleted!"

amenities = ["Bedrooms","Bathrooms","Kitchen","Dishwasher","Washing machine","Dining Room","Lounge","Garden","Balcony","Parking spaces"]

puts "Creating new seeds..."

amenities.each do |amenity|
  Perk.new(name: amenity).save
end

puts "All done!"

# Perk.new("Bedrooms")
# Perk.new("Bathrooms")
# Perk.new("Kitchen")
# Perk.new("Dishwasher")
# Perk.new("Washing machine")
# Perk.new("Dining Room")
# Perk.new("Lounge")
# Perk.new("Garden")
# Perk.new("Balcony")
# Perk.new("Parking spaces")
