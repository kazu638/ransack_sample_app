100.times do |n|
  user_name = Faker::Name.name
  age = rand(5..100)
  location = Faker::Games::Pokemon.location

  pokemon_name = Faker::Games::Pokemon.name
  ability = Faker::Games::Pokemon.move

  User.create!(
    name: user_name,
    age: age,
    address: location,
  )

  Pokemon.create!(
    name: pokemon_name
  )

  Ability.create!(
    ability: ability
  )
end

user_pokemons = []
User.all.ids.sort.each do |user_id|
  Pokemon.all.shuffle.each_with_index do |pokemon, index|
    break if index == 6
    user_pokemons << { user_id: user_id, pokemon_id: pokemon.id }
  end
end
UserPokemon.create!(user_pokemons)

ability_set = []
Pokemon.all.ids.sort.each do |pokemon_id|
  Ability.all.shuffle.each_with_index do |ability, index|
    break if index == 4
    ability_set << { ability_id: ability.id, pokemon_id: pokemon_id}
  end
end
AbilityPokemon.create!(ability_set)