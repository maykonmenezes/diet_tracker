class Diet < ApplicationRecord
  belongs_to :user

  validates :start, :end, :init_weight, :height, :ideal_weight, presence: true
  validates_numericality_of :init_weight, :height, :ideal_weight, greater_than: 0.0 
end
