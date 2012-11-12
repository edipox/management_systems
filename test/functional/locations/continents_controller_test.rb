require 'test_helper'

class Locations::ContinentsControllerTest < ActionController::TestCase
  setup do
    @locations_continent = locations_continents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations_continents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create locations_continent" do
    assert_difference('Locations::Continent.count') do
      post :create, locations_continent: { name: @locations_continent.name }
    end

    assert_redirected_to locations_continent_path(assigns(:locations_continent))
  end

  test "should show locations_continent" do
    get :show, id: @locations_continent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @locations_continent
    assert_response :success
  end

  test "should update locations_continent" do
    put :update, id: @locations_continent, locations_continent: { name: @locations_continent.name }
    assert_redirected_to locations_continent_path(assigns(:locations_continent))
  end

  test "should destroy locations_continent" do
    assert_difference('Locations::Continent.count', -1) do
      delete :destroy, id: @locations_continent
    end

    assert_redirected_to locations_continents_path
  end
end
