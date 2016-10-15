require 'test_helper'

class StationControllerTest < ActionDispatch::IntegrationTest
  test "should get bus_tracker" do
    get station_bus_tracker_url
    assert_response :success
  end

  test "should get train_tracker" do
    get station_train_tracker_url
    assert_response :success
  end

end
