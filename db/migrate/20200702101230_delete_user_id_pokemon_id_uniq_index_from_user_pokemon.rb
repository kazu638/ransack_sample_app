class DeleteUserIdPokemonIdUniqIndexFromUserPokemon < ActiveRecord::Migration[5.2]
  def change
    remove_index :user_pokemons, [:user_id, :pokemon_id]
    add_index :user_pokemons, [:user_id, :pokemon_id]
  end
end
