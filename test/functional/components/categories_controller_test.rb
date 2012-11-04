require 'test_helper'

class Components::CategoriesControllerTest < ActionController::TestCase
  setup do
    @components_category = components_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_category" do
    assert_difference('Components::Category.count') do
      post :create, components_category: { description: @components_category.description, name: @components_category.name }
    end

    assert_redirected_to components_category_path(assigns(:components_category))
  end

  test "should show components_category" do
    get :show, id: @components_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @components_category
    assert_response :success
  end

  test "should update components_category" do
    put :update, id: @components_category, components_category: { description: @components_category.description, name: @components_category.name }
    assert_redirected_to components_category_path(assigns(:components_category))
  end

  test "should destroy components_category" do
    assert_difference('Components::Category.count', -1) do
      delete :destroy, id: @components_category
    end

    assert_redirected_to components_categories_path
  end
end
