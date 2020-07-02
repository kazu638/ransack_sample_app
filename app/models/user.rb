class User < ApplicationRecord
  has_many :user_pokemons, dependent: :destroy
  has_many :pokemons, through: :user_pokemons
  accepts_nested_attributes_for :user_pokemons

  validates :user_pokemons, length: { maximum: 6 }

  def self.ransackable_attributes(auth_object = nil)
    %w[name age address]
  end
end
