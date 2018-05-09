class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title, limit: 100, null: false, unique: true
      t.integer :width
      t.integer :height
      t.binary :gamedata
      t.boolean :is_active, null: false, default: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :games, :title, where: "deleted_at IS NULL"
    add_index :games, :deleted_at
  end
end
