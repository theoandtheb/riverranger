require 'test_helper'

class StudiesControllerTest < ActionController::TestCase
  setup do
    @study = studies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:studies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study" do
    assert_difference('Study.count') do
      post :create, study: { abstract: @study.abstract, author: @study.author, observation_id: @study.observation_id, title: @study.title, url: @study.url }
    end

    assert_redirected_to study_path(assigns(:study))
  end

  test "should show study" do
    get :show, id: @study
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study
    assert_response :success
  end

  test "should update study" do
    patch :update, id: @study, study: { abstract: @study.abstract, author: @study.author, observation_id: @study.observation_id, title: @study.title, url: @study.url }
    assert_redirected_to study_path(assigns(:study))
  end

  test "should destroy study" do
    assert_difference('Study.count', -1) do
      delete :destroy, id: @study
    end

    assert_redirected_to studies_path
  end
end
