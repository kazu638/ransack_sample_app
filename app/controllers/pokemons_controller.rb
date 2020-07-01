class PokemonsController < ApplicationController
  def index
    @search = Pokemon.ransack(params[:q])
    @pokemons = @search.result.page(params[:page])
    @search.build_condition if @search.conditions.empty?
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end