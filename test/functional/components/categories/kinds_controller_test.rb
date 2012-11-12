require 'test_helper'

class Components::Categories::KindsControllerTest < ActionController::TestCase
  setup do
    @components_categories_kind = components_categories_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_categories_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_categories_kind" do
    assert_difference('Components::Categories::Kind.count') do
      post :create, components_categories_kind: { name: @components_categories_kind.name }
    end

    assert_redirected_to components_categories_kind_path(assigns(:components_categories_kind))
  end

  test "should show components_categories_kind" do
    get :show, id: @components_categories_kind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @components_categories_kind
    assert_response :success
  end

  test "should update components_categories_kind" do
    put :update, id: @components_categories_kind, components_categories_kind: { name: @components_categories_kind.name }
    assert_redirected_to components_categories_kind_path(assigns(:components_categories_kind))
  end

  test "should destroy components_categories_kind" do
    assert_difference('Components::Categories::Kind.count', -1) do
      delete :destroy, id: @components_categories_kind
    end

    assert_redirected_to components_categories_kinds_path
  end
end
