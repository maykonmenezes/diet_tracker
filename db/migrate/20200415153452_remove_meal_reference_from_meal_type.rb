class RemoveMealReferenceFromMealType < ActiveRecord::Migration[6.0]
  def change
     remove_column :meal_types, :meal_id
  end
end
