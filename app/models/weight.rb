class Weight < ApplicationRecord
  belongs_to :user

  validates :value, presence: true

  def get_weights_by_date
    
  end
end
