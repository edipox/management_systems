require 'test_helper'

class Requests::Devolutions::ComponentsControllerTest < ActionController::TestCase
  setup do
    @requests_devolutions_component = requests_devolutions_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests_devolutions_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requests_devolutions_component" do
    assert_difference('Requests::Devolutions::Component.count') do
      post :create, requests_devolutions_component: { reason: @requests_devolutions_component.reason, status_id: @requests_devolutions_component.status_id, transaction_id: @requests_devolutions_component.transaction_id, user_id: @requests_devolutions_component.user_id }
    end

    assert_redirected_to requests_devolutions_component_path(assigns(:requests_devolutions_component))
  end

  test "should show requests_devolutions_component" do
    get :show, id: @requests_devolutions_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requests_devolutions_component
    assert_response :success
  end

  test "should update requests_devolutions_component" do
    put :update, id: @requests_devolutions_component, requests_devolutions_component: { reason: @requests_devolutions_component.reason, status_id: @requests_devolutions_component.status_id, transaction_id: @requests_devolutions_component.transaction_id, user_id: @requests_devolutions_component.user_id }
    assert_redirected_to requests_devolutions_component_path(assigns(:requests_devolutions_component))
  end

  test "should destroy requests_devolutions_component" do
    assert_difference('Requests::Devolutions::Component.count', -1) do
      delete :destroy, id: @requests_devolutions_component
    end

    assert_redirected_to requests_devolutions_components_path
  end
end
