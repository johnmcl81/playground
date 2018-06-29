require 'test_helper'

class Level1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @level1 = level1s(:one)
  end

  test "should get index" do
    get level1s_url
    assert_response :success
  end

  test "should get new" do
    get new_level1_url
    assert_response :success
  end

  test "should create level1" do
    assert_difference('Level1.count') do
      post level1s_url, params: { level1: {  } }
    end

    assert_redirected_to level1_url(Level1.last)
  end

  test "should show level1" do
    get level1_url(@level1)
    assert_response :success
  end

  test "should get edit" do
    get edit_level1_url(@level1)
    assert_response :success
  end

  test "should update level1" do
    patch level1_url(@level1), params: { level1: {  } }
    assert_redirected_to level1_url(@level1)
  end

  test "should destroy level1" do
    assert_difference('Level1.count', -1) do
      delete level1_url(@level1)
    end

    assert_redirected_to level1s_url
  end
end
