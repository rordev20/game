require 'rails_helper'
describe Game, :type => :model do
  before(:all) do 
    @active_game = FactoryBot.create(:game, is_active: true)
    @inactive_game = FactoryBot.create(:game, is_active: false)
    @game_data = Game.get_name_game_data
  end

  describe 'Validations' do
    subject { FactoryBot.build(:game) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:game_data) }
  end

  describe 'check game data' do
    context "check results for active game" do
      it 'should have valid title' do
        expect(@game_data.map {|e| e[:title]}).to include(@active_game.title)
      end
    end

    context "check results for inactive game" do
      it 'should have valid title' do
        expect(@game_data.map {|e| e[:title]}).not_to include(@inactive_game.title)
      end
    end
  end

  describe 'check active scope' do
    before(:all) do
      @active_games = Game.active
    end 
    it "it should have only active games" do
      expect(@active_games).to include(@active_game) 
    end

    it "it should not have inactive games" do 
      expect(@active_games).not_to include(@inactive_game) 
    end 
  end

  describe 'check dynamically generated instance methods' do 
    it "it should repond to game height pixel method" do 
      expect(@active_game).to respond_to(:game_height_in_pixel)
    end

    it "it should not repond to xyz method" do 
      expect(@active_game).not_to respond_to(:xyz)
    end 
  end
end