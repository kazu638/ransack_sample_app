class PokemonsController < ApplicationController
  def index
    @search = Pokemon.ransack(params[:q])
    @pokemons = @search.result
    @search.build_condition if @search.conditions.empty?
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end