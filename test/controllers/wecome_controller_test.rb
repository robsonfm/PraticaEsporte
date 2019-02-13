require 'test_helper'

class WecomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wecome_index_url
    assert_response :success
  end

end
