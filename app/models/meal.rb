class Meal < ApplicationRecord
  belongs_to :diet

  validates :meal_type, :time_schedule, :description, presence: true
end
