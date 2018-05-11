FactoryBot.define do
  factory :game do
    sequence(:title) { |n| "#{Faker::Name.name}#{n}" }
    width Faker::Number.digit
    height Faker::Number.digit
    avatar File.new(Rails.root.join('storage', 'blinker.png'), "r")
    game_data [[0,0],[1,0],[2,0]]
    is_active Faker::Boolean.boolean
  end
end