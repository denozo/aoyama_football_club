require 'test_helper'

class Admins::InformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_informations_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_informations_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_informations_create_url
    assert_response :success
  end

  test "should get edit" do
    get admins_informations_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_informations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_informations_destroy_url
    assert_response :success
  end

end
