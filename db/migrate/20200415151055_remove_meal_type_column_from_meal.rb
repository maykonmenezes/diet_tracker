class RemoveMealTypeColumnFromMeal < ActiveRecord::Migration[6.0]
  def change
    remove_column :meals, :meal_type
  end
end
