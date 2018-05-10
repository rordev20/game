class GamesController < ApplicationController
  before_action :set_game_data, only: [:game_board]

  # this method gives list of games with width and height of game board
  def game_board
    @games = Game.active
    @game_board_width = AppSetting.get_value('width')
    @game_board_height = AppSetting.get_value('height')
    respond_to do |format|
      format.html
    end
  end
  
  # get game data to set for game board
  def set_game_data 
    gon.game_data = Game.get_name_game_data
  end
end
