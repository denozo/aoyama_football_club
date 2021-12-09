require 'test_helper'

class Admins::GraduatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_graduates_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_graduates_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_graduates_create_url
    assert_response :success
  end

  test "should get show" do
    get admins_graduates_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_graduates_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_graduates_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_graduates_destroy_url
    assert_response :success
  end

end
