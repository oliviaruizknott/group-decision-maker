# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

eat = Question.create!(text: "Where should we eat?", passcode: "2346")
watch = Question.create!(text: "What should we watch?", passcode: "3495")
spring_break = Question.create!(text: "Where should we go for Spring Break?", passcode: "8898")

chipotle = Option.create!(text: "Chipotle", question_id: 1)
sweetgreen = Option.create!(text: "sweetgreen", question_id: 1)
verts = Option.create!(text: "Verts", question_id: 1)
subway = Option.create!(text: "Subway", question_id: 1)

hitchhiker = Option.create!(text: "The Hitchhiker’s Guide to the Galaxy", question_id: 2)
get_out = Option.create!(text: "Get Out", question_id: 2)
ghost = Option.create!(text: "Ghost in the Shell", question_id: 2)
lego_movie = Option.create!(text: "The Lego Movie", question_id: 2)
beauty_and_beast = Option.create!(text: "Beauty and the Beast", question_id: 2)
casablanca = Option.create!(text: "Casablanca", question_id: 2)

icecland = Option.create!(text: "Iceland", question_id: 3)
kenya = Option.create!(text: "Kenya", question_id: 3)
north_korea = Option.create!(text: "North Korea", question_id: 3)

scores = [-2, -1, 1, 2]

# 5 responses to "Where should we eat?"
5.times do
  Response.create!(score: scores.sample, option: chipotle)
  Response.create!(score: scores.sample, option: sweetgreen)
  Response.create!(score: scores.sample, option: verts)
  Response.create!(score: scores.sample, option: subway)
end

# 8 responses to "What should we watch?"
8.times do
  Response.create!(score: scores.sample, option: hitchhiker)
  Response.create!(score: scores.sample, option: get_out)
  Response.create!(score: scores.sample, option: ghost)
  Response.create!(score: scores.sample, option: lego_movie)
  Response.create!(score: scores.sample, option: beauty_and_beast)
  Response.create!(score: scores.sample, option: casablanca)
end

# 4 responses to "Where should we go for spring break?"
4.times do
  Response.create!(score: scores.sample, option: icecland)
  Response.create!(score: scores.sample, option: kenya)
  Response.create!(score: scores.sample, option: north_korea)
end
