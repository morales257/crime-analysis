require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get neighbourhood_maps" do
    get :neighbourhood_maps
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end
