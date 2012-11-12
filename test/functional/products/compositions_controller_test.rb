require 'test_helper'

class Products::CompositionsControllerTest < ActionController::TestCase
  setup do
    @products_composition = products_compositions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products_compositions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create products_composition" do
    assert_difference('Products::Composition.count') do
      post :create, products_composition: { description: @products_composition.description, name: @products_composition.name }
    end

    assert_redirected_to products_composition_path(assigns(:products_composition))
  end

  test "should show products_composition" do
    get :show, id: @products_composition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @products_composition
    assert_response :success
  end

  test "should update products_composition" do
    put :update, id: @products_composition, products_composition: { description: @products_composition.description, name: @products_composition.name }
    assert_redirected_to products_composition_path(assigns(:products_composition))
  end

  test "should destroy products_composition" do
    assert_difference('Products::Composition.count', -1) do
      delete :destroy, id: @products_composition
    end

    assert_redirected_to products_compositions_path
  end
end
