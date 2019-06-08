# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# As it is an exercise and to limit the database entries
# each time we seed we delete the previous ones
User.destroy_all
Ad.destroy_all
Type.destroy_all
Category.destroy_all

# ---------- TYPES AND CATEGORIES -----------
# We create the real types and categories
# We put them in variables so we can easily use them during ad seeding.

# ----- /!\ Icons must be added after ActiveStorage is ready -----
# Types

	@lesson = Type.create(name: "Cours")
	@help = Type.create(name: "Coup de main")
	@project = Type.create(name: "Projet")


# Categories
	@cooking = Category.create(name: "Cuisine")
	@diy = Category.create(name: "Artisanat")
	@music = Category.create(name: "Musique")
	@art = Category.create(name: "Art")
	@games = Category.create(name: "Jeux")
	@tech = Category.create(name: "Technologie")
	@garage = Category.create(name: "Mécanique")
	@sport = Category.create(name: "Sport")
	@gardening = Category.create(name: "Jardinage")
	@writing = Category.create(name: "Écriture")
	@languages = Category.create(name: "Langues")

# ---------- FAKE USERS AND ADS -----------

10.times do 
	# We create a few example users
	user = User.create!(
		last_name: Faker::Name.last_name,
		first_name: Faker::Name.first_name,
		email: Faker::Internet.email,
		password: "dumdum",
		description: Faker::Lorem.paragraph_by_chars(125, false),
		skills: Faker::Job.field
		)
	puts "Fake user added"

	# We create a few example ads
	a = Ad.create!(
		title: Faker::Lorem.paragraph_by_chars(40, false),
		description: Faker::Lorem.paragraph_by_chars(175, false),
		type: [@lesson, @help, @project].sample,
		category: [@cooking, @diy, @music, @art, @games, @tech, @garage, @sport, @gardening, @writing, @languages].sample,
		duration: ["1h", "2h", "3h", "4h", "5h", "6h", "Non défini"].sample,
		frequency: ["Quotidien", "Hebdomadaire", "Mensuel", "Non défini"].sample,
		other_propositions: [true, false].sample,
		availability: ["Semaine", "Week-end", "Semaine et Week-end"].sample,
		user: user
		)
	puts "Fake ad added"
end


# ---------- ADMIN ----------

# We create the admin user
admin = User.create(
	last_name: "Admin",
	first_name: "John",
	email: "johnadmin@yopmail.com",
	password: "admin123",
	description: Faker::Lorem.paragraph_by_chars(125, false),
	skills: Faker::Job.field,
	is_admin: true
	)

puts "----------------------"
puts "-- Admin created !! --"
puts "----------------------"
puts "login: johnadmin@yopmail.com"
puts "password: admin123"



