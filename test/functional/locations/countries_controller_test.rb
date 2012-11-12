require 'test_helper'

class Locations::CountriesControllerTest < ActionController::TestCase
  setup do
    @locations_country = locations_countries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations_countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locations_country" do
    assert_difference('Locations::Country.count') do
      post :create, locations_country: { name: @locations_country.name }
    end

    assert_redirected_to locations_country_path(assigns(:locations_country))
  end

  test "should show locations_country" do
    get :show, id: @locations_country
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @locations_country
    assert_response :success
  end

  test "should update locations_country" do
    put :update, id: @locations_country, locations_country: { name: @locations_country.name }
    assert_redirected_to locations_country_path(assigns(:locations_country))
  end

  test "should destroy locations_country" do
    assert_difference('Locations::Country.count', -1) do
      delete :destroy, id: @locations_country
    end

    assert_redirected_to locations_countries_path
  end
end
