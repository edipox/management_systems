require 'test_helper'

class Products::Compositions::DetailsControllerTest < ActionController::TestCase
  setup do
    @products_compositions_detail = products_compositions_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products_compositions_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create products_compositions_detail" do
    assert_difference('Products::Compositions::Detail.count') do
      post :create, products_compositions_detail: { components_id: @products_compositions_detail.components_id, composition_id: @products_compositions_detail.composition_id, quantity: @products_compositions_detail.quantity }
    end

    assert_redirected_to products_compositions_detail_path(assigns(:products_compositions_detail))
  end

  test "should show products_compositions_detail" do
    get :show, id: @products_compositions_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @products_compositions_detail
    assert_response :success
  end

  test "should update products_compositions_detail" do
    put :update, id: @products_compositions_detail, products_compositions_detail: { components_id: @products_compositions_detail.components_id, composition_id: @products_compositions_detail.composition_id, quantity: @products_compositions_detail.quantity }
    assert_redirected_to products_compositions_detail_path(assigns(:products_compositions_detail))
  end

  test "should destroy products_compositions_detail" do
    assert_difference('Products::Compositions::Detail.count', -1) do
      delete :destroy, id: @products_compositions_detail
    end

    assert_redirected_to products_compositions_details_path
  end
end
