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
	  character_name = params[:saved_game][:character_name]

	  if @saved_game.data.present?
	    game_data = JSON.parse(@saved_game.data)
	  else
	    game_data = {}
	  end

	  game_data["character_name"] = character_name
	  @saved_game.data = game_data.to_json

	  if @saved_game.save
	    redirect_to menu_index_path, notice: 'Game was successfully created.'
	  else
	    render :new, status: :unprocessable_entity
	  end
	end


	# Ensure saved_game_params is ready to accept all necessary parameters
	def saved_game_params
	params.require(:saved_game).permit(:data, :name, :character_name)
	end
	
	private

	def saved_game_params
	params.require(:saved_game).permit(:name, :data)
	# Ensure :data is permitted correctly based on how you plan to handle it (e.g., as a string, JSON, etc.)
	end
	end
