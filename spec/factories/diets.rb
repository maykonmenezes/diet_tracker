FactoryBot.define do
  factory :diet do
    init_weight { 89 }
    ideal_weight { 69 }
    height { 1.45 }
    start_date { Time.now }
    end_date { Time.now }
    user
  end
end
