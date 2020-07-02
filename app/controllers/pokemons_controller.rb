class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  def index
    @search = Pokemon.ransack(params[:q])
    @pokemons = @search.result.page(params[:page])
    @search.build_condition if @search.conditions.empty?
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    pokemon = Pokemon.new(pokemon_params)
    if pokemon.save
      redirect_to pokemons_path, notice: "ポケモンの作成に成功しました!"
    else
      flash.now[:alert] = "ポケモンの作成に失敗しました！"
      render :new
    end
    rescue ActiveRecord::NotNullViolation
      redirect_to new_pokemon_path, alert: "ポケモンの作成に失敗しました！"
  end

  def show
  end

  def edit
  end

  def update
    if @pokemon.update(pokemon_params)
      redirect_to pokemons_path, notice: "更新に成功しました！"
    else
      flash.now[:alert] = "更新に失敗しました！"
      render :edit
    end
    rescue ActiveRecord::NotNullViolation
      redirect_to edit_pokemon_path(@pokemon.id), alert: "ポケモンの作成に失敗しました！"
  end

  def destroy
    if @pokemon.destroy
      redirect_to pokemons_path, notice: "削除に成功しました！"
    else
      redirect_to pokemons_path, alert: "削除に失敗しました！"
    end
  end

  private
    def pokemon_params
      params.require(:pokemon).permit(:name)
    end

    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end
end