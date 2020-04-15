class Meal < ApplicationRecord
  belongs_to :diet
  has_one :meal_type

  validates :time_schedule, :description, presence: true
end
