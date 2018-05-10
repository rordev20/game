class AddImageToGames < ActiveRecord::Migration[5.2]
  def up
    add_attachment :games, :avatar
  end

  def down
    remove_attachment :games, :avatar
  end
end
