class AddRentalIdToPosition < ActiveRecord::Migration[5.0]
  def change
    add_reference :positions, :rental, foreign_key: true
  end
end
