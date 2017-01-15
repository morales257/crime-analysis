require 'test_helper'

class CrimeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, crime: { objid: 001, time: "2016-12-04T10:36:07.000Z", district: "D1", call_type: "Assault", 
      streets: "Yonge St & Bloor", longitude: -1.4928, latitude: 4.3924}
    assert_response :success
  end


end
