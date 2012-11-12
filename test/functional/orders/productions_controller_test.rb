require 'test_helper'

class Orders::ProductionsControllerTest < ActionController::TestCase
  setup do
    @orders_production = orders_productions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders_productions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orders_production" do
    assert_difference('Orders::Production.count') do
      post :create, orders_production: { status_id: @orders_production.status_id, transaction_id: @orders_production.transaction_id, user_id: @orders_production.user_id }
    end

    assert_redirected_to orders_production_path(assigns(:orders_production))
  end

  test "should show orders_production" do
    get :show, id: @orders_production
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orders_production
    assert_response :success
  end

  test "should update orders_production" do
    put :update, id: @orders_production, orders_production: { status_id: @orders_production.status_id, transaction_id: @orders_production.transaction_id, user_id: @orders_production.user_id }
    assert_redirected_to orders_production_path(assigns(:orders_production))
  end

  test "should destroy orders_production" do
    assert_difference('Orders::Production.count', -1) do
      delete :destroy, id: @orders_production
    end

    assert_redirected_to orders_productions_path
  end
end
