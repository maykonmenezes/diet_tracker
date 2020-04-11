class AddHeightToDiet < ActiveRecord::Migration[6.0]
  def change
    add_column :diets, :height, :float
  end
end
