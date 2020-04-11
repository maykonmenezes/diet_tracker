class User < ApplicationRecord
  has_many :weights
  has_many :diets
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
