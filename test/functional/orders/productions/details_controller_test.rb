require 'test_helper'

class Orders::Productions::DetailsControllerTest < ActionController::TestCase
  setup do
    @orders_productions_detail = orders_productions_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders_productions_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orders_productions_detail" do
    assert_difference('Orders::Productions::Detail.count') do
      post :create, orders_productions_detail: { header_id: @orders_productions_detail.header_id, product_id: @orders_productions_detail.product_id, quantity: @orders_productions_detail.quantity }
    end

    assert_redirected_to orders_productions_detail_path(assigns(:orders_productions_detail))
  end

  test "should show orders_productions_detail" do
    get :show, id: @orders_productions_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orders_productions_detail
    assert_response :success
  end

  test "should update orders_productions_detail" do
    put :update, id: @orders_productions_detail, orders_productions_detail: { header_id: @orders_productions_detail.header_id, product_id: @orders_productions_detail.product_id, quantity: @orders_productions_detail.quantity }
    assert_redirected_to orders_productions_detail_path(assigns(:orders_productions_detail))
  end

  test "should destroy orders_productions_detail" do
    assert_difference('Orders::Productions::Detail.count', -1) do
      delete :destroy, id: @orders_productions_detail
    end

    assert_redirected_to orders_productions_details_path
  end
end
