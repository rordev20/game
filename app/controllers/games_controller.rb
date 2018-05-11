class GamesController < ApplicationController
  before_action :set_game_data, :build_app_settings_singleton_methods, only: [:game_board]

  # this method gives list of games with width and height of game board
  def game_board
    begin
      @games = Game.active
      @game_board_width = AppSetting.get_value_width
      @game_board_height = AppSetting.get_value_height
    rescue CustomException::GameBoardSettingMissing => e
      logger.info e.message
      logger.info e.backtrace
      flash[:alert] = e.message
    end
    respond_to do |format|
      format.html
    end
  end
  
  # get game data to set for game board
  def set_game_data 
    gon.game_data = Game.get_name_game_data
  end

  # This method create necessary singleton class method for appsetting
  def build_app_settings_singleton_methods
    Game.game_board_fields.each do |action|
      AppSetting.create_singleton_methods(action)
    end
  end
end
