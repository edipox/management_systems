require 'test_helper'

class Locations::CitiesControllerTest < ActionController::TestCase
  setup do
    @locations_city = locations_cities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations_cities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locations_city" do
    assert_difference('Locations::City.count') do
      post :create, locations_city: { name: @locations_city.name }
    end

    assert_redirected_to locations_city_path(assigns(:locations_city))
  end

  test "should show locations_city" do
    get :show, id: @locations_city
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @locations_city
    assert_response :success
  end

  test "should update locations_city" do
    put :update, id: @locations_city, locations_city: { name: @locations_city.name }
    assert_redirected_to locations_city_path(assigns(:locations_city))
  end

  test "should destroy locations_city" do
    assert_difference('Locations::City.count', -1) do
      delete :destroy, id: @locations_city
    end

    assert_redirected_to locations_cities_path
  end
end
