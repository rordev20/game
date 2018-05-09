class Game < ApplicationRecord
  acts_as_paranoid
  validates :title, presence: true, uniqueness: true
  validates :gamedata, presence: true, binary: true
  validates :width, :height, presence: true, numericality: { only_integer: true }
end
