require 'test_helper'

class Components::ModelsControllerTest < ActionController::TestCase
  setup do
    @components_model = components_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:components_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create components_model" do
    assert_difference('Components::Model.count') do
      post :create, components_model: { brand_id: @components_model.brand_id, description: @components_model.description, name: @components_model.name }
    end

    assert_redirected_to components_model_path(assigns(:components_model))
  end

  test "should show components_model" do
    get :show, id: @components_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @components_model
    assert_response :success
  end

  test "should update components_model" do
    put :update, id: @components_model, components_model: { brand_id: @components_model.brand_id, description: @components_model.description, name: @components_model.name }
    assert_redirected_to components_model_path(assigns(:components_model))
  end

  test "should destroy components_model" do
    assert_difference('Components::Model.count', -1) do
      delete :destroy, id: @components_model
    end

    assert_redirected_to components_models_path
  end
end
