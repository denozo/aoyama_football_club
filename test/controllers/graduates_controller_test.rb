require 'test_helper'

class GraduatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get graduates_index_url
    assert_response :success
  end

  test "should get show" do
    get graduates_show_url
    assert_response :success
  end

end
