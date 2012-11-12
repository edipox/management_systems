require 'test_helper'

class Locations::RegionsControllerTest < ActionController::TestCase
  setup do
    @locations_region = locations_regions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations_regions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locations_region" do
    assert_difference('Locations::Region.count') do
      post :create, locations_region: { name: @locations_region.name }
    end

    assert_redirected_to locations_region_path(assigns(:locations_region))
  end

  test "should show locations_region" do
    get :show, id: @locations_region
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @locations_region
    assert_response :success
  end

  test "should update locations_region" do
    put :update, id: @locations_region, locations_region: { name: @locations_region.name }
    assert_redirected_to locations_region_path(assigns(:locations_region))
  end

  test "should destroy locations_region" do
    assert_difference('Locations::Region.count', -1) do
      delete :destroy, id: @locations_region
    end

    assert_redirected_to locations_regions_path
  end
end
