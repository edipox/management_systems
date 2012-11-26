require 'test_helper'

class Requests::Transferences::Finished::Components::DetailsControllerTest < ActionController::TestCase
  setup do
    @requests_transferences_finished_components_detail = requests_transferences_finished_components_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests_transferences_finished_components_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requests_transferences_finished_components_detail" do
    assert_difference('Requests::Transferences::Finished::Components::Detail.count') do
      post :create, requests_transferences_finished_components_detail: {  }
    end

    assert_redirected_to requests_transferences_finished_components_detail_path(assigns(:requests_transferences_finished_components_detail))
  end

  test "should show requests_transferences_finished_components_detail" do
    get :show, id: @requests_transferences_finished_components_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requests_transferences_finished_components_detail
    assert_response :success
  end

  test "should update requests_transferences_finished_components_detail" do
    put :update, id: @requests_transferences_finished_components_detail, requests_transferences_finished_components_detail: {  }
    assert_redirected_to requests_transferences_finished_components_detail_path(assigns(:requests_transferences_finished_components_detail))
  end

  test "should destroy requests_transferences_finished_components_detail" do
    assert_difference('Requests::Transferences::Finished::Components::Detail.count', -1) do
      delete :destroy, id: @requests_transferences_finished_components_detail
    end

    assert_redirected_to requests_transferences_finished_components_details_path
  end
end
