require 'test_helper'

class Guardians::InformationForGuardiansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guardians_information_for_guardians_index_url
    assert_response :success
  end

  test "should get show" do
    get guardians_information_for_guardians_show_url
    assert_response :success
  end

end
