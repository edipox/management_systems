require 'test_helper'

class StockControllerTest < ActionController::TestCase
  test "should get components" do
    get :components
    assert_response :success
  end

end
