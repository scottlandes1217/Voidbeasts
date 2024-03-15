class SavedGamesController < ApplicationController
  before_action :authenticate_user!

  def index
    @saved_games = current_user.saved_games
  end

  def show
    @saved_game = SavedGame.find(params[:id])
  end

  def new
    @saved_game = current_user.saved_games.build
  end

  def create
    @saved_game = current_user.saved_games.build(saved_game_params)
    if @saved_game.save
      redirect_to saved_games_path, notice: 'Game was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def saved_game_params
    params.require(:saved_game).permit(:name, :data)
    # Ensure :data is permitted correctly based on how you plan to handle it (e.g., as a string, JSON, etc.)
  end
end
