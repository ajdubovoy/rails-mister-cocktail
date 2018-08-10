# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

Review.destroy_all
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients['drinks'].each { |ingredient| Ingredient.create(name: ingredient['strIngredient1']) }

12.times do
  random_image = (rand() * 50).to_i
  photo = "https://picsum.photos/300/200?image=#{random_image}"
  cocktail = Cocktail.new(name: Faker::Coffee.blend_name)
  cocktail.remote_photo_url = photo
  cocktail.save
end

rand_2 = 

Cocktail.all.each { |cocktail| (rand() * 10 + 1).to_i.times { Dose.create(cocktail: cocktail, ingredient: Ingredient.all.sample, description: Faker::Coffee.notes) }  }

Cocktail.all.each { |cocktail| (rand() * 10).to_i.times { Review.create(cocktail: cocktail, content: Faker::FamousLastWords.last_words, rating: (rand() * 4 + 1).to_i) } }