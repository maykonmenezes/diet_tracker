class CreateMealTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_types do |t|
      t.string :value
      t.references :meal, null: false, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
