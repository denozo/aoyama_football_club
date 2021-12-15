require 'test_helper'

class Guardians::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get guardians_homes_edit_url
    assert_response :success
  end

  test "should get update" do
    get guardians_homes_update_url
    assert_response :success
  end

end
