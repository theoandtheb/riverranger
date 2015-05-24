require 'test_helper'

class OgrgeojsonsControllerTest < ActionController::TestCase
  setup do
    @ogrgeojson = ogrgeojsons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ogrgeojsons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ogrgeojson" do
    assert_difference('Ogrgeojson.count') do
      post :create, ogrgeojson: { name: @ogrgeojson.name, wkb_geometry: @ogrgeojson.wkb_geometry }
    end

    assert_redirected_to ogrgeojson_path(assigns(:ogrgeojson))
  end

  test "should show ogrgeojson" do
    get :show, id: @ogrgeojson
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ogrgeojson
    assert_response :success
  end

  test "should update ogrgeojson" do
    patch :update, id: @ogrgeojson, ogrgeojson: { name: @ogrgeojson.name, wkb_geometry: @ogrgeojson.wkb_geometry }
    assert_redirected_to ogrgeojson_path(assigns(:ogrgeojson))
  end

  test "should destroy ogrgeojson" do
    assert_difference('Ogrgeojson.count', -1) do
      delete :destroy, id: @ogrgeojson
    end

    assert_redirected_to ogrgeojsons_path
  end
end
