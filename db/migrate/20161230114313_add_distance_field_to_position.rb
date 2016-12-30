class AddDistanceFieldToPosition < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :distance, :float
  end
end
