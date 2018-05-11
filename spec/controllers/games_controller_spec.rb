require 'rails_helper'

describe GamesController, type: :controller do
  describe 'before actions' do
    it { is_expected.to use_before_action(:set_game_data) }
    it { is_expected.to use_before_action(:build_app_settings_singleton_methods) }
  end

  describe "GET game_board" do
    it 'renders index template' do
      get :game_board
      expect(response).to be_success
      expect(response).to render_template(:game_board)
    end
  end
end
