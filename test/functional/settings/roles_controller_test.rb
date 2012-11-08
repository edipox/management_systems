require 'test_helper'

class Settings::RolesControllerTest < ActionController::TestCase
  setup do
    @settings_role = settings_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settings_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create settings_role" do
    assert_difference('Settings::Role.count') do
      post :create, settings_role: { name: @settings_role.name }
    end

    assert_redirected_to settings_role_path(assigns(:settings_role))
  end

  test "should show settings_role" do
    get :show, id: @settings_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @settings_role
    assert_response :success
  end

  test "should update settings_role" do
    put :update, id: @settings_role, settings_role: { name: @settings_role.name }
    assert_redirected_to settings_role_path(assigns(:settings_role))
  end

  test "should destroy settings_role" do
    assert_difference('Settings::Role.count', -1) do
      delete :destroy, id: @settings_role
    end

    assert_redirected_to settings_roles_path
  end
end
