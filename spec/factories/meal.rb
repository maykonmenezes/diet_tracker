FactoryBot.define do
  factory :meal do
    description { 'Some breakfast' }
    time_schedule { DateTime.new }
    meal_type_id { 1 }
  end
end
