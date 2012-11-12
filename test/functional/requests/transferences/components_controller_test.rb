require 'test_helper'

class Requests::Transferences::ComponentsControllerTest < ActionController::TestCase
  setup do
    @requests_transferences_component = requests_transferences_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests_transferences_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requests_transferences_component" do
    assert_difference('Requests::Transferences::Component.count') do
      post :create, requests_transferences_component: { status_id: @requests_transferences_component.status_id, transaction_id: @requests_transferences_component.transaction_id, user_id: @requests_transferences_component.user_id }
    end

    assert_redirected_to requests_transferences_component_path(assigns(:requests_transferences_component))
  end

  test "should show requests_transferences_component" do
    get :show, id: @requests_transferences_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requests_transferences_component
    assert_response :success
  end

  test "should update requests_transferences_component" do
    put :update, id: @requests_transferences_component, requests_transferences_component: { status_id: @requests_transferences_component.status_id, transaction_id: @requests_transferences_component.transaction_id, user_id: @requests_transferences_component.user_id }
    assert_redirected_to requests_transferences_component_path(assigns(:requests_transferences_component))
  end

  test "should destroy requests_transferences_component" do
    assert_difference('Requests::Transferences::Component.count', -1) do
      delete :destroy, id: @requests_transferences_component
    end

    assert_redirected_to requests_transferences_components_path
  end
end
