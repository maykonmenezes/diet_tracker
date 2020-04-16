FactoryBot.define do
  factory :diet do
    init_weight { 89 }
    ideal_weight { 69 }
    height { 1.45 }
    start_date { DateTime.new }
    end_date { DateTime.new }
    meal
  end
end
