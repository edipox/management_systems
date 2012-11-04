require 'test_helper'

class Components::ItemsControllerTest < ActionController::TestCase
  setup do
    @components_item = components_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_item" do
    assert_difference('Components::Item.count') do
      post :create, components_item: { category: @components_item.category, code: @components_item.code, description: @components_item.description, name: @components_item.name }
    end

    assert_redirected_to components_item_path(assigns(:components_item))
  end

  test "should show components_item" do
    get :show, id: @components_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @components_item
    assert_response :success
  end

  test "should update components_item" do
    put :update, id: @components_item, components_item: { category: @components_item.category, code: @components_item.code, description: @components_item.description, name: @components_item.name }
    assert_redirected_to components_item_path(assigns(:components_item))
  end

  test "should destroy components_item" do
    assert_difference('Components::Item.count', -1) do
      delete :destroy, id: @components_item
    end

    assert_redirected_to components_items_path
  end
end
