require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  test "cannot save without a rental_id" do
    position = Position.new(rental_id: nil, timestamp: 1230940953, latitude: 2.0, longitude: 2.0)
    assert_not position.save
  end
  
  test "cannot save without a timestamp" do
    position = Position.new(rental_id: 0, timestamp: nil, latitude: 2.0, longitude: 2.0)
    assert_not position.save
  end

  test "cannot save without a latitude" do
    position = Position.new(rental_id: 0, timestamp: 1230940953, latitude: nil, longitude: 2.0)
    assert_not position.save
  end

  test "cannot save without a longitude" do
    position = Position.new(rental_id: 0, timestamp: 1230940953, latitude: 2.0, longitude: nil)
    assert_not position.save
  end
  
end
