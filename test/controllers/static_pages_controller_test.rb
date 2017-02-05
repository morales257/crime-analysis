require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get neighbourhood_maps" do
    get :neighbourhood_maps
    assert_response :success
  end

end
