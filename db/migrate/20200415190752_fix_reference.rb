class FixReference < ActiveRecord::Migration[6.0]
  def change
    remove_column :meals, :meal_type_id
    add_reference :meals, :meal_type, index: true, foreign_key: true
  end
end
