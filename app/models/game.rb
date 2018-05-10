class Game < ApplicationRecord
  acts_as_paranoid
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :title, presence: true, uniqueness: true
  validates :game_data, presence: true #, binary: true
  validates :width, :height, presence: true, numericality: { only_integer: true }
  scope :active, -> {where(is_active: true)}

  ["height", "width"].each do |action|
    define_method("game_#{action}_in_pixel") do
      "#{self.send(action.to_sym)} px" 
    end
  end

  # set array of hash for all game data
  def self.get_name_game_data
    games = Game.active
    game_name_data_array = []
    games.each do |game|
      game_name_data_array << {title: game.title, game_data: JSON.parse(game.game_data)}
    end 
    game_name_data_array
  end
  
end
