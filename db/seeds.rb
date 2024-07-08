# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "starting seed"

User.create!(email: "stef@me.fr", password: "azerty")

puts "user ok"

Bike.create!(name: "VTT canondale", description: "adapté à tout les terrains", user: User.first)
Bike.create!(name: "VTT cube", description: "pour les puristes", user: User.first)
Bike.create!(name: "VTT specialized", description: "descente tout droit, il craint rien ", user: User.first)
Bike.create!(name: "VTT moustache", description: "frisez vous", user: User.first)

puts "all ok"
