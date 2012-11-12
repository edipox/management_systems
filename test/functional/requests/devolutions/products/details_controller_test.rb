require 'test_helper'

class Requests::Devolutions::Products::DetailsControllerTest < ActionController::TestCase
  setup do
    @requests_devolutions_products_detail = requests_devolutions_products_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests_devolutions_products_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requests_devolutions_products_detail" do
    assert_difference('Requests::Devolutions::Products::Detail.count') do
      post :create, requests_devolutions_products_detail: { header_id: @requests_devolutions_products_detail.header_id, product_id: @requests_devolutions_products_detail.product_id }
    end

    assert_redirected_to requests_devolutions_products_detail_path(assigns(:requests_devolutions_products_detail))
  end

  test "should show requests_devolutions_products_detail" do
    get :show, id: @requests_devolutions_products_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requests_devolutions_products_detail
    assert_response :success
  end

  test "should update requests_devolutions_products_detail" do
    put :update, id: @requests_devolutions_products_detail, requests_devolutions_products_detail: { header_id: @requests_devolutions_products_detail.header_id, product_id: @requests_devolutions_products_detail.product_id }
    assert_redirected_to requests_devolutions_products_detail_path(assigns(:requests_devolutions_products_detail))
  end

  test "should destroy requests_devolutions_products_detail" do
    assert_difference('Requests::Devolutions::Products::Detail.count', -1) do
      delete :destroy, id: @requests_devolutions_products_detail
    end

    assert_redirected_to requests_devolutions_products_details_path
  end
end
