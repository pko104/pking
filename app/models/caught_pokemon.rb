class CaughtPokemon < ActiveRecord::Base
  has_many :pokemons
  belongs_to :ranking_table
end
