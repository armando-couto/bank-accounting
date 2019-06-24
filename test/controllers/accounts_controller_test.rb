require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get balance" do
    get accounts_balance_url
    assert_response :success
  end

end
