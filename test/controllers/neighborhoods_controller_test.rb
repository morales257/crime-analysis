require 'test_helper'

class NeighborhoodsControllerTest < ActionController::TestCase

  def setup
    @neighborhood = neighborhoods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  #test "should get show" do
  #  get :show, id: @neighborhood.id, as: :json
  #  assert_response :success
  #end

end
