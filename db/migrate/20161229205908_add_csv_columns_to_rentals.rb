class AddCsvColumnsToRentals < ActiveRecord::Migration[5.0]
  def up
    add_attachment :rentals, :csv
  end

  def down
    remove_attachment :rentals, :csv
  end
end
