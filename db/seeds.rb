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


	bailly = User.create!(
		last_name: "Bailly",
		first_name: "Astrid",
		email: "Bailly_Astrid@yopmail.com",
		password: "dumdum",
		description: "Salut, je suis Astrid j'ai 23 ans, je suis photographe, j'aime les films, les séries et la musique. Je me suis inscrite pour apprendre a faire des patisseries",
		skills: "photographie, badminton"
		)

	puts "Fake user added"

	lefevre = User.create!(
		last_name: "Lefevre",
		first_name: "Alain",
		email: "Lefevre.a@yopmail.com",
		password: "dumdum",
		description: "Bonjour, je me nomme Alain, 41 ans, je suis menuisier depuis 20 ans. Je suis passioné par la pêche et la musique et je suis ici pour qu'on m'enseigne le piano",
		skills: "menuiserie, pêche"
		)

	puts "Fake user added"

	chauvet = User.create!(
		last_name: "Chauvet",
		first_name: "Mathilde",
		email: "Mathidle_c@yopmail.com",
		password: "dumdum",
		description: "Moi c'est Mathilde, je suis âgée de 32 ans. Je fais de la patisserie depuis mes 25ans, j'aime voyager, la photographie et le tennis, je viens sur ce site pour découvrir le monde de la photographie ",
		skills: "patissière"
		)

	puts "Fake user added"

	charrier = User.create!(
		last_name: "Charrier",
		first_name: "Thibault",
		email: "Thibault_charrier@yopmail.com",
		password: "dumdum",
		description: "Hello, je suis Thibault, j'ai 21 ans je suis étudiant en langues étrangères. J'adore les animaux et tout ce qui est en rapport avec les animaux , j'aimerais apprendre à cuisiner et a pêcher",
		skills: "Anglais, Espagnol"
		)

	puts "Fake user added"

	schmitt = User.create!(
		last_name: "Schmitt",
		first_name: "Anne",
		email: "Schmittanne@yopmail.com",
		password: "dumdum",
		description: "Hey, je suis Anne, 28ans, developpeuse web et pianiste dans un groupe de musique, je suis fan d'animation japonaise, je souhaite apprendre l'espagnol et j'aimerais bien découvrir la pêche",
		skills: "devloppeuse web, pianiste"
		)

	puts "Fake user added"


	a1 = Ad.create!(
		title: "Projet, création d'une maison en bois",
		description: "Je cherche des personnes motivés pour construire une maison en bois. Etant menuisier je peux vous donner des astuces et des conseils pour mener la construction à bien",
		type: @project,
		category: @diy,
		duration: "2h",
		frequency: "Non défini",
		other_propositions: false,
		availability: "week-end",
		user: lefevre
		)

	puts "fake ad added"

	a2 = Ad.create!(
		title: "Apprendre a faire un tiramisu",
		description: "Coucou, j'aimerais bien apprendre a faire un tiramisu pour un repas de famille, je peux enseigner les bases de la photographie en echange si besoin",
		type: @lesson,
		category: @cooking,
		duration: "1h",
		frequency: "Quotidien",
		other_propositions: true,
		availability: "Semaine et Week-end",
		user: bailly
		)

	puts "fake ad added"

	a3 = Ad.create!(
		title: "Recherche un guitariste",
		description: "Salut, je cherche un guitariste compétent pour assurer une représentation ce soir avec mon groupe de musique, je peux donner des cours de piano en echange de ce coup de main",
		type: @help,
		category: @music,
		duration: "2h",
		frequency: "Non défini",
		other_propositions: false,
		availability: "week-end",
		user: schmitt
		)

	puts "fake ad added"

	a4 = Ad.create!(
		title: "Cours de pêche ",
		description: "Bonsoir, étant passionné de pêche, je cherche une personne apte a m'apprendre les bases de la pêche. En contrepartie je peux enseigner l'anglais ou l'espagnol",
		type: @lesson,
		category: @gardening,
		duration: "3h",
		frequency: "Hebdomadaire",
		other_propositions: true,
		availability: "Semaine et Week-end",
		user: charrier
		)

	puts "fake ad added"

	a5 = Ad.create!(
		title: "Découvrir l'espagnol",
		description: "Hello, ayant un bon niveau en anglais, je souhaite apprendre a parler espagnol. Je peux proposer mes sevices de developpeuse web en echange :)",
		type: @lesson,
		category: @languages,
		duration: "3h", 
		frequency: "Quotidien",
		other_propositions: false,
		availability: "Week-end",
		user: chauvet
		)

	puts "fake ad added"


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



