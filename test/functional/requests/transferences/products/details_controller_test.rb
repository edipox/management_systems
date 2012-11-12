require 'test_helper'

class Requests::Transferences::Products::DetailsControllerTest < ActionController::TestCase
  setup do
    @requests_transferences_products_detail = requests_transferences_products_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests_transferences_products_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requests_transferences_products_detail" do
    assert_difference('Requests::Transferences::Products::Detail.count') do
      post :create, requests_transferences_products_detail: { header_id: @requests_transferences_products_detail.header_id, product_id: @requests_transferences_products_detail.product_id, quantity: @requests_transferences_products_detail.quantity }
    end

    assert_redirected_to requests_transferences_products_detail_path(assigns(:requests_transferences_products_detail))
  end

  test "should show requests_transferences_products_detail" do
    get :show, id: @requests_transferences_products_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requests_transferences_products_detail
    assert_response :success
  end

  test "should update requests_transferences_products_detail" do
    put :update, id: @requests_transferences_products_detail, requests_transferences_products_detail: { header_id: @requests_transferences_products_detail.header_id, product_id: @requests_transferences_products_detail.product_id, quantity: @requests_transferences_products_detail.quantity }
    assert_redirected_to requests_transferences_products_detail_path(assigns(:requests_transferences_products_detail))
  end

  test "should destroy requests_transferences_products_detail" do
    assert_difference('Requests::Transferences::Products::Detail.count', -1) do
      delete :destroy, id: @requests_transferences_products_detail
    end

    assert_redirected_to requests_transferences_products_details_path
  end
end
