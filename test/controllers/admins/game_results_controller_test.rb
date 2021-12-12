require 'test_helper'

class Admins::GameResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_game_results_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_game_results_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_game_results_create_url
    assert_response :success
  end

  test "should get show" do
    get admins_game_results_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_game_results_edit_url
    assert_response :success
  end

  test "should get update" do
    get admins_game_results_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_game_results_destroy_url
    assert_response :success
  end

end
