class Weight < ApplicationRecord
  belongs_to :user

  validates :value, :weighting_date, presence: true
end
