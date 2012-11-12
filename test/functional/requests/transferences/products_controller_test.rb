require 'test_helper'

class Requests::Transferences::ProductsControllerTest < ActionController::TestCase
  setup do
    @requests_transferences_product = requests_transferences_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests_transferences_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requests_transferences_product" do
    assert_difference('Requests::Transferences::Product.count') do
      post :create, requests_transferences_product: { status_id: @requests_transferences_product.status_id, transaction_id: @requests_transferences_product.transaction_id, user_id: @requests_transferences_product.user_id }
    end

    assert_redirected_to requests_transferences_product_path(assigns(:requests_transferences_product))
  end

  test "should show requests_transferences_product" do
    get :show, id: @requests_transferences_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requests_transferences_product
    assert_response :success
  end

  test "should update requests_transferences_product" do
    put :update, id: @requests_transferences_product, requests_transferences_product: { status_id: @requests_transferences_product.status_id, transaction_id: @requests_transferences_product.transaction_id, user_id: @requests_transferences_product.user_id }
    assert_redirected_to requests_transferences_product_path(assigns(:requests_transferences_product))
  end

  test "should destroy requests_transferences_product" do
    assert_difference('Requests::Transferences::Product.count', -1) do
      delete :destroy, id: @requests_transferences_product
    end

    assert_redirected_to requests_transferences_products_path
  end
end
