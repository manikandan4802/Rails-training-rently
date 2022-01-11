require 'test_helper'

class LockCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lock_code = lock_codes(:one)
  end

  test "should get index" do
    get lock_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_lock_code_url
    assert_response :success
  end

  test "should create lock_code" do
    assert_difference('LockCode.count') do
      post lock_codes_url, params: { lock_code: { code: @lock_code.code, invitation: @lock_code.invitation, property_id: @lock_code.property_id, smart_lock_id: @lock_code.smart_lock_id } }
    end

    assert_redirected_to lock_code_url(LockCode.last)
  end

  test "should show lock_code" do
    get lock_code_url(@lock_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_lock_code_url(@lock_code)
    assert_response :success
  end

  test "should update lock_code" do
    patch lock_code_url(@lock_code), params: { lock_code: { code: @lock_code.code, invitation: @lock_code.invitation, property_id: @lock_code.property_id, smart_lock_id: @lock_code.smart_lock_id } }
    assert_redirected_to lock_code_url(@lock_code)
  end

  test "should destroy lock_code" do
    assert_difference('LockCode.count', -1) do
      delete lock_code_url(@lock_code)
    end

    assert_redirected_to lock_codes_url
  end
end
