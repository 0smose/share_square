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

puts "User added"

lefevre = User.create!(
	last_name: "Lefevre",
	first_name: "Alain",
	email: "Lefevre.a@yopmail.com",
	password: "dumdum",
	description: "Bonjour, je me nomme Alain, 41 ans, je suis menuisier depuis 20 ans. Je suis passioné par la pêche et la musique et je suis ici pour qu'on m'enseigne le piano",
	skills: "menuiserie, pêche"
	)

puts "User added"

chauvet = User.create!(
	last_name: "Chauvet",
	first_name: "Mathilde",
	email: "Mathidle_c@yopmail.com",
	password: "dumdum",
	description: "Moi c'est Mathilde, je suis âgée de 32 ans. Je fais de la patisserie depuis mes 25ans, j'aime voyager, la photographie et le tennis, je viens sur ce site pour découvrir le monde de la photographie ",
	skills: "patissière"
	)

puts "User added"

charrier = User.create!(
	last_name: "Charrier",
	first_name: "Thibault",
	email: "Thibault_charrier@yopmail.com",
	password: "dumdum",
	description: "Hello, je suis Thibault, j'ai 21 ans je suis étudiant en langues étrangères. J'adore les animaux et tout ce qui est en rapport avec les animaux , j'aimerais apprendre à cuisiner et a pêcher",
	skills: "Anglais, Espagnol"
	)

puts "User added"

schmitt = User.create!(
	last_name: "Schmitt",
	first_name: "Anne",
	email: "Schmittanne@yopmail.com",
	password: "dumdum",
	description: "Hey, je suis Anne, 28ans, developpeuse web et pianiste dans un groupe de musique, je suis fan d'animation japonaise, je souhaite apprendre l'espagnol et j'aimerais bien découvrir la pêche",
	skills: "devloppeuse web, pianiste"
	)

puts "User added"

peron = User.create!(
	last_name: "Peron-Andre",
	first_name: "Émilie",
	email: "Emilile_peron-andre@yopmail.com",
	password: "dumdum",
	description: "Coucou, moi c'est Émilie, j'ai 24 ans et je suis fleuriste, j'aime l'agriculture. Je me suis inscrite pour apprendre a créer un site internet",
	skills: "Fleuriste"
	)

puts "User added"

garcia = User.create!(
	last_name: "Garcia",
	first_name: "François",
	email: "Garcia.francois@yopmail.com",
	password: "dumdum",
	description: "Bonjour, je me nomme François, j'ai 39 ans. Je suis peintre a mon compte, j'aime dessiner, la peinture et je veux apprendre la cuisine orientale",
	skills: "Dessins, peinture"
	)

puts "User added"

chauveau = User.create!(
	last_name: "Chauveau",
	first_name: "André",
	email: "André_chauveau@yopmail.com",
	password: "dumdum",
	description: "Je m'appelle André, 46 ans, je suis chef de partie dans un grand restaurant. Je voudrais apprendre a jouer de la batterie.",
	skills: "Cuisinier"
	)

puts "User added"

aubry = User.create!(
	last_name: "Aubry",
	first_name: "Lorraine",
	email: "Lorraineaubry@yopmail.com",
	password: "dumdum",
	description: "Salut, moi c'est Lorraine, j'ai 22 ans. Je suis croupière de metier et je fais des tours de magie a mes heures perdus.",
	skills: "Croupière, Magicienne"
	)

puts "User added"

barbe = User.create!(
	last_name: "Barbe",
	first_name: "Victor",
	email: "Barbe-victor@yopmail.com",
	password: "dumdum",
	description: "Hello, je suis Victor, 29 ans, je travaille dans la carrosserie. Je fais de la danse depuis 10 ans et j'aimerais apprendre a faire des tours de magie",
	skills: "Carrossier"
	)

puts "User added"


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

puts "Ad added"

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

puts "Ad added"

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

puts "Ad added"

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

puts "Ad added"

a5 = Ad.create!(
	title: "Découvrir l'espagnol",
	description: "Hello, ayant un bon niveau en anglais, je souhaite apprendre a parler espagnol. Je peux proposer mes sevices de developpeuse web en echange :)",
	type: @lesson,
	category: @languages,
	duration: "1h", 
	frequency: "Quotidien",
	other_propositions: false,
	availability: "Week-end",
	user: chauvet
	)

puts "Ad added"

a6 = Ad.create!(
	title: "Tours de magie",
	description: "Coucou, Je voudrais apprendre a faire des tours de magie, en contrepartie, je peux donner des cours de cuisine.",
	type: @lesson,
	category: @games,
	duration: "2h", 
	frequency: "Mensuel",
	other_propositions: false,
	availability: "N'importe quand",
	user: chauveau
	)

puts "Ad added"

a7 = Ad.create!(
	title: "Alors on danse",
	description: "Bonjour je cherche a monter un groupe de danse, je peux vous enseigner la danse pour ceux qui en ont jamais fait.",
	type: @project,
	category: @sport,
	duration: "2h", 
	frequency: "Hebdomadaire",
	other_propositions: true,
	availability: "N'importe quand",
	user: barbe
	)

puts "Ad added"

a8 = Ad.create!(
	title: "Jardinage",
	description: "Salut, j'aurais besoin d'un coup de main pour faire planter des tomates, des roses et de la menthe, je peux en echange donner des cours de dessins ou de peinture",
	type: @help,
	category: @gardening,
	duration: "1h", 
	frequency: "Non défini",
	other_propositions: true,
	availability: "Semaine et week-end",
	user: garcia
	)

puts "Ad added"

a9 = Ad.create!(
	title: "Apprendre a entretenir une voiture",
	description: "Bonjour, je cherche quelqu'un qui pourrait m'apprendre comment bien entretenir ma voiture, je peux en echange vous apprendre a faire des GIF via photoshop",
	type: @help,
	category: @garage,
	duration: "3h", 
	frequency: "Mensuel",
	other_propositions: false,
	availability: "week-end",
	user: schmitt
	)

puts "Ad added"

a10 = Ad.create!(
	title: "Gateau au chocolat",
	description: "Salut, je propose un atelier ou l'on ferais un gateau a la fraise. Sachant que je suis pas douée en cuisine si quelqu'un s'y connait pour nous coacher en même temps, ce serais parfait",
	type: @project,
	category: @cooking,
	duration: "2h", 
	frequency: "Non défini",
	other_propositions: true,
	availability: "Semaine et week-end",
	user: aubry
	)

puts "Ad added"
# ---------- ADMIN ----------

# We create the admin user
admin = User.create!(
	last_name: "Admin",
	first_name: "John",
	email: "johnadmin@yopmail.com",
	password: "admin123",
	description: "Bonjour, je m'appelle John j'ai 30 ans, je suis l'administrateur de Share Square. Je suis développeur web full stack. N'hésitez pas a me contacter pour toutes questions concerant le site ",
	skills: "Développeur web full stack",
	is_admin: "true"
	)

puts "----------------------"
puts "-- Admin created !! --"
puts "----------------------"
puts "login: johnadmin@yopmail.com"
puts "password: admin123"