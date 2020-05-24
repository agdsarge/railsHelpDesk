require 'test_helper'

class IspsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get isps_index_url
    assert_response :success
  end

  test "should get show" do
    get isps_show_url
    assert_response :success
  end

  test "should get new" do
    get isps_new_url
    assert_response :success
  end

  test "should get edit" do
    get isps_edit_url
    assert_response :success
  end

end
