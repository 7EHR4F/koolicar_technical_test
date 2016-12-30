class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.integer :timestamp
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
