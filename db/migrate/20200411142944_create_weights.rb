class CreateWeights < ActiveRecord::Migration[6.0]
  def change
    create_table :weights do |t|
      t.float :value
      t.date :weighting_date
      t.references :user, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
