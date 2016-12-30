require 'test_helper'

class RentalsControllerTest < ActionDispatch::IntegrationTest
  test "should get rental form" do
    get rentals_new_url
	assert_response :success
  end

  test "should create rental" do
    assert_difference('Rental.count') do
      post rentals_parse_locations_url, params: { rental: { csv: fixture_file_upload('positions_6118_csv.csv', 'text/csv') }}
    end
  end

end
