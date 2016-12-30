require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "cannot save without a message" do
    event = Event.new(message: nil)
	assert_not event.save
  end
end
