class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.date :start
      t.date :end
      t.float :init_weight
      t.float :ideal_weight
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
