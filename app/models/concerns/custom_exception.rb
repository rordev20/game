module CustomException
  extend ActiveSupport::Concern
  class GameBoardSettingMissing < StandardError
    def initialize(field = nil)
      @field = field
    end
    def message
      I18n.t('custom_exception.setting_missing', setting_name: @field)
    end
  end
end