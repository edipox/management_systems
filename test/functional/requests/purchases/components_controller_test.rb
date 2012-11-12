require 'test_helper'

class Requests::Purchases::ComponentsControllerTest < ActionController::TestCase
  setup do
    @requests_purchases_component = requests_purchases_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests_purchases_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requests_purchases_component" do
    assert_difference('Requests::Purchases::Component.count') do
      post :create, requests_purchases_component: { status_id: @requests_purchases_component.status_id, transaction_id: @requests_purchases_component.transaction_id, user_id: @requests_purchases_component.user_id }
    end

    assert_redirected_to requests_purchases_component_path(assigns(:requests_purchases_component))
  end

  test "should show requests_purchases_component" do
    get :show, id: @requests_purchases_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requests_purchases_component
    assert_response :success
  end

  test "should update requests_purchases_component" do
    put :update, id: @requests_purchases_component, requests_purchases_component: { status_id: @requests_purchases_component.status_id, transaction_id: @requests_purchases_component.transaction_id, user_id: @requests_purchases_component.user_id }
    assert_redirected_to requests_purchases_component_path(assigns(:requests_purchases_component))
  end

  test "should destroy requests_purchases_component" do
    assert_difference('Requests::Purchases::Component.count', -1) do
      delete :destroy, id: @requests_purchases_component
    end

    assert_redirected_to requests_purchases_components_path
  end
end
