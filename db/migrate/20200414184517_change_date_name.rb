class ChangeDateName < ActiveRecord::Migration[6.0]
  def change
    rename_column :diets, :end, :end_date
    rename_column :diets, :start, :start_date
  end
end
