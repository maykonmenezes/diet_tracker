class User < ApplicationRecord
  has_many :weights
  has_one :diet

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
