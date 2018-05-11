require 'rails_helper'

describe AppSetting, :type => :model do 

  before(:all) do 
    @active_app_setting = FactoryBot.create(:app_setting, is_active: true)
    @inactive_app_setting = FactoryBot.create(:app_setting, is_active: false)
  end

  describe 'Validations' do
    subject { FactoryBot.build(:app_setting) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'check active scope' do
    before(:all) do
      @app_settings = AppSetting.active
    end

    it "it should have only active app settings" do 
      expect(@app_settings).to include(@active_app_setting) 
    end

    it "it should not have inactive app settings" do 
      expect(@app_settings).not_to include(@inactive_app_setting) 
    end 
  end

  describe 'check get value method' do 
    it "it should return only active app settings value" do 
      active_app_setting_value = AppSetting.get_value(@active_app_setting.name) 
      expect(active_app_setting_value).to eq(@active_app_setting.value) 
    end

    it "it should not return inactive app settings" do 
      inactive_app_setting_value = AppSetting.get_value(@inactive_app_setting.name) 
      expect(inactive_app_setting_value).not_to eq(@inactive_app_setting.value) 
    end 
  end
end