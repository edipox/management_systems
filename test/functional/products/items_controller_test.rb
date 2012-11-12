require 'test_helper'

class Products::ItemsControllerTest < ActionController::TestCase
  setup do
    @products_item = products_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create products_item" do
    assert_difference('Products::Item.count') do
      post :create, products_item: { minimum_quantity: @products_item.minimum_quantity, model_id: @products_item.model_id, name: @products_item.name, price: @products_item.price, quantity: @products_item.quantity }
    end

    assert_redirected_to products_item_path(assigns(:products_item))
  end

  test "should show products_item" do
    get :show, id: @products_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @products_item
    assert_response :success
  end

  test "should update products_item" do
    put :update, id: @products_item, products_item: { minimum_quantity: @products_item.minimum_quantity, model_id: @products_item.model_id, name: @products_item.name, price: @products_item.price, quantity: @products_item.quantity }
    assert_redirected_to products_item_path(assigns(:products_item))
  end

  test "should destroy products_item" do
    assert_difference('Products::Item.count', -1) do
      delete :destroy, id: @products_item
    end

    assert_redirected_to products_items_path
  end
end
