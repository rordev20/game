# task to run
#rake db:create db:migrate populate_data:populate_dummy_data populate_data:create_app_settings
namespace :populate_data do
  desc "Dummy data"
  task :populate_dummy_data => :environment do
    game_array = []
    game_array << {title: 'blinker', height: 34, width: 12, game_data: [[0,0],[1,0],[2,0]], avatar: File.new(Rails.root.join('storage', 'blinker.png'), "r")}
    game_array << {title: 'glider', height: 34, width: 34, game_data: [[-1,1],[0,0],[1,0],[-1,-1],[0,-1]], avatar: File.new(Rails.root.join('storage', 'glider.png'), "r")}
    game_array << {title: 'toad', height: 34, width: 34, game_data: [[0,0],[1,0],[2,0],[-1,-1],[0,-1],[1,-1]], avatar: File.new(Rails.root.join('storage', 'toad.png'), "r")}
    game_array << {title: 'pulsar', 
                    height: 50,
                    width: 50, 
                    game_data: [[0,0],[1,0],[2,0],[6,0],[7,0],[8,0],
                               [-2,2],[3,2],[5,2],[10,2],
                               [-2,3],[3,3],[5,3],[10,3],
                               [-2,4],[3,4],[5,4],[10,4],
                               [0,5],[1,5],[2,5],[6,5],[7,5],[8,5],
                               [0,7],[1,7],[2,7],[6,7],[7,7],[8,7],
                               [-2,8],[3,8],[5,8],[10,8],
                               [-2,9],[3,9],[5,9],[10,9],
                               [-2,10],[3,10],[5,10],[10,10],
                               [0,12],[1,12],[2,12],[6,12],[7,12],[8,12]], 
                    avatar: File.new(Rails.root.join('storage', 'pulsar.png'), "r")
                  }
    game_array.each do |game_values|
      game = Game.where(title: game_values[:title]).first_or_initialize
      game.height = game_values[:height]
      game.width = game_values[:width]
      game.game_data = game_values[:game_data]
      game.avatar = game_values[:avatar]
      game.save!
    end
  end

  desc "app settings"
  task :create_app_settings => :environment do
    app_settings_array = []
    app_settings_array << {name: 'width', value: 50, description: "width of game board" }
    app_settings_array << {name: 'height', value: 50, description: "height of game board" }
    app_settings_array << {name: 'box_size', value: 10, description: "size of unit box" }
    app_settings_array << {name: 'game_speed', value: 100, description: "speed of movement" }
    app_settings_array.each do |app_setting_values|
      app_setting = AppSetting.where(name: app_setting_values[:name]).first_or_initialize
      app_setting.value = app_setting_values[:value]
      app_setting.description = app_setting_values[:description]
      app_setting.save!
    end
  end
end