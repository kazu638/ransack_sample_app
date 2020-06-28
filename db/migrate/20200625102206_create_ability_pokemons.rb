class CreateAbilityPokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :ability_pokemons do |t|
      t.references :ability, foreign_key: true
      t.references :pokemon, foreign_key: true
      t.timestamps
    end
    add_index :ability_pokemons, [:ability_id, :pokemon_id], unique: true
  end
end
