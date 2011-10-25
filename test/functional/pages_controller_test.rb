require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get mat_y_pat" do
    get :mat_y_pat
    assert_response :success
  end

  test "should get consultorio" do
    get :consultorio
    assert_response :success
  end

  test "should get contacto" do
    get :contacto
    assert_response :success
  end

end
