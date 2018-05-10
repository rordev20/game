class AppSetting < ApplicationRecord
  acts_as_paranoid
  validates :name, presence: true, uniqueness: true
  scope :active, -> {where(is_active: true)}

  # this method return app setting value by name
  def self.get_value(name)
    app_setting = self.active.where(name: name).first
    app_setting ? app_setting.value : nil
  end

end
