class Ability < ApplicationRecord
  has_many :ability_pokemons, dependent: :destroy
  has_many :pokemons, through: :ability_pokemons
  accepts_nested_attributes_for :ability_pokemons
end
