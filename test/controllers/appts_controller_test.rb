require 'test_helper'

class ApptsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appts_index_url
    assert_response :success
  end

  test "should get show" do
    get appts_show_url
    assert_response :success
  end

  test "should get new" do
    get appts_new_url
    assert_response :success
  end

  test "should get edit" do
    get appts_edit_url
    assert_response :success
  end

end
