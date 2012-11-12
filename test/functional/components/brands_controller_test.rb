require 'test_helper'

class Components::BrandsControllerTest < ActionController::TestCase
  setup do
    @components_brand = components_brands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_brands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_brand" do
    assert_difference('Components::Brand.count') do
      post :create, components_brand: { description: @components_brand.description, name: @components_brand.name }
    end

    assert_redirected_to components_brand_path(assigns(:components_brand))
  end

  test "should show components_brand" do
    get :show, id: @components_brand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @components_brand
    assert_response :success
  end

  test "should update components_brand" do
    put :update, id: @components_brand, components_brand: { description: @components_brand.description, name: @components_brand.name }
    assert_redirected_to components_brand_path(assigns(:components_brand))
  end

  test "should destroy components_brand" do
    assert_difference('Components::Brand.count', -1) do
      delete :destroy, id: @components_brand
    end

    assert_redirected_to components_brands_path
  end
end
