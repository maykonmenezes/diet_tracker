class Diet < ApplicationRecord
  belongs_to :user
  has_many :meals

  validates :start_date, :end_date, :init_weight, :height, :ideal_weight, presence: true
  validates_numericality_of :init_weight, :height, :ideal_weight, greater_than: 0.0

  accepts_nested_attributes_for :meals, allow_destroy: true
end
