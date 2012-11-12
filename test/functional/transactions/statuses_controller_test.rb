require 'test_helper'

class Transactions::StatusesControllerTest < ActionController::TestCase
  setup do
    @transactions_status = transactions_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transactions_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transactions_status" do
    assert_difference('Transactions::Status.count') do
      post :create, transactions_status: { name: @transactions_status.name }
    end

    assert_redirected_to transactions_status_path(assigns(:transactions_status))
  end

  test "should show transactions_status" do
    get :show, id: @transactions_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transactions_status
    assert_response :success
  end

  test "should update transactions_status" do
    put :update, id: @transactions_status, transactions_status: { name: @transactions_status.name }
    assert_redirected_to transactions_status_path(assigns(:transactions_status))
  end

  test "should destroy transactions_status" do
    assert_difference('Transactions::Status.count', -1) do
      delete :destroy, id: @transactions_status
    end

    assert_redirected_to transactions_statuses_path
  end
end
