class ChangeTypeNameToMealType < ActiveRecord::Migration[6.0]
  def change
    rename_column :meals, :type, :meal_type
  end
end
