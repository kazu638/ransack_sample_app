class User < ApplicationRecord
  has_many :user_pokemons, dependent: :destroy
  has_many :pokemons, through: :user_pokemons

  def self.ransackable_attributes(auth_object = nil)
    %w[name age address]
  end
end
