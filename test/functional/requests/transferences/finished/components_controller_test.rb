require 'test_helper'

class Requests::Transferences::Finished::ComponentsControllerTest < ActionController::TestCase
  setup do
    @requests_transferences_finished_component = requests_transferences_finished_components(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests_transferences_finished_components)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requests_transferences_finished_component" do
    assert_difference('Requests::Transferences::Finished::Component.count') do
      post :create, requests_transferences_finished_component: {  }
    end

    assert_redirected_to requests_transferences_finished_component_path(assigns(:requests_transferences_finished_component))
  end

  test "should show requests_transferences_finished_component" do
    get :show, id: @requests_transferences_finished_component
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requests_transferences_finished_component
    assert_response :success
  end

  test "should update requests_transferences_finished_component" do
    put :update, id: @requests_transferences_finished_component, requests_transferences_finished_component: {  }
    assert_redirected_to requests_transferences_finished_component_path(assigns(:requests_transferences_finished_component))
  end

  test "should destroy requests_transferences_finished_component" do
    assert_difference('Requests::Transferences::Finished::Component.count', -1) do
      delete :destroy, id: @requests_transferences_finished_component
    end

    assert_redirected_to requests_transferences_finished_components_path
  end
end
