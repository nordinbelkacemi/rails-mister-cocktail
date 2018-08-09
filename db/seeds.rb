require "json"
require "open-uri"

URL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

menu = JSON.parse(open(URL).read)

menu["drinks"].each do |ingredient|
  Ingredient.create(
    name: ingredient["strIngredient1"]
  )
end

(1..20).each { Cocktail.create(name: Faker::Science.scientist) }

(1..150).each do
  Dose.create(description: "#{(rand * 100).round} ml", ingredient_id: rand * 160, cocktail_id: rand * 20);
end
