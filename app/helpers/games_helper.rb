module GamesHelper
  # return game speed
  def get_game_speed
    AppSetting.get_value('game_speed')
  end
  
  # return game box size 
  def get_box_size
    AppSetting.get_value('box_size')
  end
end
