require 'test_helper'

class Requests::Devolutions::ProductsControllerTest < ActionController::TestCase
  setup do
    @requests_devolutions_product = requests_devolutions_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests_devolutions_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requests_devolutions_product" do
    assert_difference('Requests::Devolutions::Product.count') do
      post :create, requests_devolutions_product: { reason: @requests_devolutions_product.reason, status_id: @requests_devolutions_product.status_id, transaction_id: @requests_devolutions_product.transaction_id, user_id: @requests_devolutions_product.user_id }
    end

    assert_redirected_to requests_devolutions_product_path(assigns(:requests_devolutions_product))
  end

  test "should show requests_devolutions_product" do
    get :show, id: @requests_devolutions_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requests_devolutions_product
    assert_response :success
  end

  test "should update requests_devolutions_product" do
    put :update, id: @requests_devolutions_product, requests_devolutions_product: { reason: @requests_devolutions_product.reason, status_id: @requests_devolutions_product.status_id, transaction_id: @requests_devolutions_product.transaction_id, user_id: @requests_devolutions_product.user_id }
    assert_redirected_to requests_devolutions_product_path(assigns(:requests_devolutions_product))
  end

  test "should destroy requests_devolutions_product" do
    assert_difference('Requests::Devolutions::Product.count', -1) do
      delete :destroy, id: @requests_devolutions_product
    end

    assert_redirected_to requests_devolutions_products_path
  end
end
