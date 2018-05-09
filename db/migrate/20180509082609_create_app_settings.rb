class CreateAppSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :app_settings do |t|
      t.string :name, limit: 40, null: false
      t.string :value
      t.text :description
      t.boolean :is_active, null: false, default: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :app_settings, :name, where: "deleted_at IS NULL"
    add_index :app_settings, :deleted_at
  end
end
