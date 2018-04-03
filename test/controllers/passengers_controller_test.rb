require 'test_helper'

class PassengersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get passengers_index_url
    assert_response :success
  end

  test "should get create" do
    get passengers_create_url
    assert_response :success
  end

  test "should get destory" do
    get passengers_destory_url
    assert_response :success
  end

  test "should get edit" do
    get passengers_edit_url
    assert_response :success
  end

  test "should get new" do
    get passengers_new_url
    assert_response :success
  end

  test "should get show" do
    get passengers_show_url
    assert_response :success
  end

end
