require 'test_helper'

class RangersControllerTest < ActionController::TestCase
  setup do
    @ranger = rangers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rangers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ranger" do
    assert_difference('Ranger.count') do
      post :create, ranger: { crypted_password: @ranger.crypted_password, email: @ranger.email, first_name: @ranger.first_name, last_name: @ranger.last_name, salt: @ranger.salt, username: @ranger.username }
    end

    assert_redirected_to ranger_path(assigns(:ranger))
  end

  test "should show ranger" do
    get :show, id: @ranger
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ranger
    assert_response :success
  end

  test "should update ranger" do
    patch :update, id: @ranger, ranger: { crypted_password: @ranger.crypted_password, email: @ranger.email, first_name: @ranger.first_name, last_name: @ranger.last_name, salt: @ranger.salt, username: @ranger.username }
    assert_redirected_to ranger_path(assigns(:ranger))
  end

  test "should destroy ranger" do
    assert_difference('Ranger.count', -1) do
      delete :destroy, id: @ranger
    end

    assert_redirected_to rangers_path
  end
end
