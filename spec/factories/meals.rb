FactoryBot.define do
  factory :meal do
    description { 'Some breakfast' }
    time_schedule { DateTime.new }
    diet
  end
end
