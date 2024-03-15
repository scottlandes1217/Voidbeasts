class MenuController < ApplicationController
  before_action :authenticate_user!

  def index
    @saved_games = current_user.saved_games
  end
end
