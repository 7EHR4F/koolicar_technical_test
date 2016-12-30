require 'test_helper'

class RentalTest < ActiveSupport::TestCase

  test "should not save rental without name" do
  	rental = Rental.new
	assert_not rental.save
  end

  test "cannot save without a csv file" do
    rental = Rental.new(name: "test", kilometers: nil, csv: nil)
    assert_not rental.save
  end

  test "can generate positions from csv file" do
    rental = Rental.new(name: "test", kilometers: nil, csv: File.new(File.join(Rails.root, "positions_6118_csv.csv")))
    rental.save
    assert_difference('Position.count', 365) do
	  rental.process_csv_without_delay
	end
  end
 
end
