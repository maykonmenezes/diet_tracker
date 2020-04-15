class AddReferenceOfMealTypeInMeal < ActiveRecord::Migration[6.0]
  def change
    add_reference :meals, :meal_type, index: true
  end
end
