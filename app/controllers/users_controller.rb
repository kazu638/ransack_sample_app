class UsersController < ApplicationController
  def index
    @search = User.ransack(params[:q])
    @users = @search.result.includes(:pokemons).order(:id).page(params[:page])
    @search.build_condition if @search.conditions.empty?
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to users_path, notice: "トレーナーの作成に成功しました！"
    else
      flash.now[:alert] = "トレーナーの作成に失敗しました！"
      render :new
    end
    rescue ActiveRecord::NotNullViolation
      redirect_to new_user_path, alert: "トレーナーの作成に失敗しました！"
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.includes(:pokemons).find(params[:id])
    case pokemons_size = @user.pokemons.size
    when 0..5
      (6 - pokemons_size).times do
        @user.user_pokemons.build
      end
    end
  end

  def update
    set_user
    if @user.update!(user_pokemon_params)
      redirect_to users_path, notice: "更新に成功しました！"
    else
      flash.now[:alert] = "更新に失敗しました！"
      render :edit
    end
    rescue ActiveRecord::NotNullViolation,ActiveRecord::RecordInvalid
      redirect_to edit_user_path(@user.id), alert: "更新に失敗しました！"
  end

  def destroy
    set_user
    if @user.destroy
      redirect_to users_path, notice: "削除に成功しました！"
    else
      flash.now[:alert] = "削除に失敗しました！"
      render :index
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :age, :address)
    end

    def user_pokemon_params
      params.require(:user).permit(:name, :age, :address, user_pokemons_attributes: [:id, :pokemon_id])
    end

    def set_user
      @user = User.find(params[:id])
    end
end