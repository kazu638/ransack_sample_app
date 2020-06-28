class Pokemon < ApplicationRecord
  has_many :user_pokemons, dependent: :destroy
  has_many :users, through: :user_pokemons
  has_many :ability_pokemons, dependent: :destroy
  has_many :abilities, through: :ability_pokemons
  accepts_nested_attributes_for :user_pokemons

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end
end
