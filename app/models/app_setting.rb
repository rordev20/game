class AppSetting < ApplicationRecord
  acts_as_paranoid
  validates :name, presence: true, uniqueness: true
  scope :active, -> {where(is_active: true)}

  # This method create singleton class method for required app_settings
  def self.create_singleton_methods *actions
    actions.each do |action|
      singleton_class.send :define_method, "get_value_#{action}" do
        field = self.get_value(action)
        raise CustomException::GameBoardSettingMissing, action if field.blank?
        field
      end
    end
  end

  # this method return app setting value by name
  def self.get_value(name)
    app_setting = self.active.where(name: name).first
    app_setting ? app_setting.value : nil
  end

end
