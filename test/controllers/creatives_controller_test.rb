require 'test_helper'

class CreativesControllerTest < ActionController::TestCase
  setup do
    @creative = creatives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:creatives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create creative" do
    assert_difference('Creative.count') do
      post :create, creative: { description: @creative.description, name: @creative.name, user_id: @creative.user_id }
    end

    assert_redirected_to creative_path(assigns(:creative))
  end

  test "should show creative" do
    get :show, id: @creative
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @creative
    assert_response :success
  end

  test "should update creative" do
    patch :update, id: @creative, creative: { description: @creative.description, name: @creative.name, user_id: @creative.user_id }
    assert_redirected_to creative_path(assigns(:creative))
  end

  test "should destroy creative" do
    assert_difference('Creative.count', -1) do
      delete :destroy, id: @creative
    end

    assert_redirected_to creatives_path
  end
end
