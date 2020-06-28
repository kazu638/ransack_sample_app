class CreateUserPokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_pokemons do |t|
      t.references :user, foreign_key: true
      t.references :pokemon, foreign_key: true
      t.timestamps
    end

    add_index :user_pokemons, [:user_id, :pokemon_id], unique: true
  end
end
