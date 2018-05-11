FactoryBot.define do
  factory :app_setting do
    sequence(:name) { |n| "#{Faker::Name.name}#{n}" }
    value Faker::Number.digit
    description Faker::Name.name
    is_active Faker::Boolean.boolean
  end
end