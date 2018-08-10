require "json"
require "open-uri"

# constants
URL = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
URLS = [
  "https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=1998822d443cf97d75258149476c5aa5&auto=format&fit=crop&w=1498&q=80",
  "https://images.unsplash.com/photo-1438522014717-d7ce32b9bab9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=55cb1a59dd5a3cecf474342bc3048ea7&auto=format&fit=crop&w=1498&q=80",
  "https://images.unsplash.com/photo-1496318447583-f524534e9ce1?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c405034528cf04acab707e51be371d3c&auto=format&fit=crop&w=1705&q=80",
  "https://images.unsplash.com/photo-1472245088132-ccd50746725c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=fa7ad7a324cc9efb65fe1a3abf6c287d&auto=format&fit=crop&w=1498&q=80",
  "https://images.unsplash.com/photo-1485265449635-ca623a55e95c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e55faaaeb17f73d9c0d4b4f6aa4eba93&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1531387367216-681093c0279b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=73ca72de11ae9cd2fa7367dc1ee76705&auto=format&fit=crop&w=1432&q=80",
  "https://images.unsplash.com/photo-1453825012366-3738046cb6c7?ixlib=rb-0.3.5&s=00752ec824e669284341c7fb4e97a724&auto=format&fit=crop&w=2689&q=80",
  "https://images.unsplash.com/photo-1511715112108-9acc6c3ff61f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ad548838c131107dcc0480052d82a3ba&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1523905179092-38c52d029c9b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c5966df4e0ae577b116028dc1f9bb5ab&auto=format&fit=crop&w=2540&q=80",
  "https://images.unsplash.com/photo-1502441867382-f681599c78ad?ixlib=rb-0.3.5&s=e6569c06c9349e2b048c6470bde47618&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1514361726087-38371321b5cd?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=948204e7e206df2416092abd39d9fe3f&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1424591093900-514bab956faf?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9ed0101e6e7e48218b8318c0347730d5&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1455621481073-d5bc1c40e3cb?ixlib=rb-0.3.5&s=1cc72efb311180c54a810be32e2dda11&auto=format&fit=crop&w=1783&q=80",
  "https://images.unsplash.com/photo-1522128418537-427fea304e12?ixlib=rb-0.3.5&s=dd495ede082be90794c8fa4005b410cd&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1462887749044-b47cb05b83b8?ixlib=rb-0.3.5&s=643388231531a7acfa4c489ed6357cf5&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1457518919282-b199744eefd6?ixlib=rb-0.3.5&s=e2434e3ded24b52247429f3724facc95&auto=format&fit=crop&w=1504&q=80",
  "https://images.unsplash.com/photo-1444728399417-08d2aa39e6f4?ixlib=rb-0.3.5&s=fd45b3178c163c8b1994d703f8a425a9&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?ixlib=rb-0.3.5&s=49bf50f8cb823c2fb0054028c77f55df&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1514534309681-d89b52131352?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=56f041db5138c8c4377028f14880f61c&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1514534309681-d89b52131352?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=56f041db5138c8c4377028f14880f61c&auto=format&fit=crop&w=1500&q=80"
]

# ingredients
menu = JSON.parse(open(URL).read)

menu["drinks"].each do |ingredient|
  Ingredient.create(
    name: ingredient["strIngredient1"]
  )
end

# cocktails
(1..20).each_with_index do |cocktail, i|
  Cocktail.create(name: Faker::Science.scientist, remote_photo_url: URLS[i])
end

# doses
(1..150).each do
  args_hash = {
    description: "#{(rand * 100).round} ml",
    ingredient_id: rand * 160,
    cocktail_id: rand * 20
  }
  Dose.create(args_hash);
end
