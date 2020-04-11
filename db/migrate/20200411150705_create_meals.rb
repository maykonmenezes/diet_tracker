class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :type
      t.time :time_schedule
      t.text :description
      t.references :diet, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
