require 'test_helper'

class Admins::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_events_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_events_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_events_create_url
    assert_response :success
  end

  test "should get show" do
    get admins_events_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_events_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_events_destroy_url
    assert_response :success
  end

end
