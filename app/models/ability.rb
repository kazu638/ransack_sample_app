class Ability < ApplicationRecord
  has_many :pokemons, through: :ability_pokemons
  has_many :ability_pokemons, dependent: :destroy
  accepts_nested_attributes_for :ability_pokemons
end
