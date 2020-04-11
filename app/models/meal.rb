class Meal < ApplicationRecord
  belongs_to :diet

  validates :type, :time_schedule, :description, presence: true
end
