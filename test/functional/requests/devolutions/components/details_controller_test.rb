require 'test_helper'

class Requests::Devolutions::Components::DetailsControllerTest < ActionController::TestCase
  setup do
    @requests_devolutions_components_detail = requests_devolutions_components_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:requests_devolutions_components_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create requests_devolutions_components_detail" do
    assert_difference('Requests::Devolutions::Components::Detail.count') do
      post :create, requests_devolutions_components_detail: { component_id: @requests_devolutions_components_detail.component_id, header_id: @requests_devolutions_components_detail.header_id }
    end

    assert_redirected_to requests_devolutions_components_detail_path(assigns(:requests_devolutions_components_detail))
  end

  test "should show requests_devolutions_components_detail" do
    get :show, id: @requests_devolutions_components_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @requests_devolutions_components_detail
    assert_response :success
  end

  test "should update requests_devolutions_components_detail" do
    put :update, id: @requests_devolutions_components_detail, requests_devolutions_components_detail: { component_id: @requests_devolutions_components_detail.component_id, header_id: @requests_devolutions_components_detail.header_id }
    assert_redirected_to requests_devolutions_components_detail_path(assigns(:requests_devolutions_components_detail))
  end

  test "should destroy requests_devolutions_components_detail" do
    assert_difference('Requests::Devolutions::Components::Detail.count', -1) do
      delete :destroy, id: @requests_devolutions_components_detail
    end

    assert_redirected_to requests_devolutions_components_details_path
  end
end
