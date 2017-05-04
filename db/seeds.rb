# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.create!(question_text: "Where should we eat?", passcode: "2346")
Question.create!(question_text: "What should we watch?", passcode: "3495")
Question.create!(question_text: "Where should we go for Spring Break?", passcode: "8898")

chipotle = Option.create!(option_text: "Chipotle", question_id: 1)
sweetgreen = Option.create!(option_text: "sweetgreen", question_id: 1)
verts = Option.create!(option_text: "Verts", question_id: 1)
subway = Option.create!(option_text: "Subway", question_id: 1)

hitchhiker = Option.create!(option_text: "The Hitchhiker’s Guide to the Galaxy", question_id: 2)
get_out = Option.create!(option_text: "Get Out", question_id: 2)
ghost = Option.create!(option_text: "Ghost in the Shell", question_id: 2)
lego_movie = Option.create!(option_text: "The Lego Movie", question_id: 2)
beauty_and_beast = Option.create!(option_text: "Beauty and the Beast", question_id: 2)
casablanca = Option.create!(option_text: "Casablanca", question_id: 2)

icecland = Option.create!(option_text: "Iceland", question_id: 3)
kenya = Option.create!(option_text: "Kenya", question_id: 3)
north_korea = Option.create!(option_text: "North Korea", question_id: 3)
