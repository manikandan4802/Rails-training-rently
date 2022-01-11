require 'test_helper'

class SmartLocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smart_lock = smart_locks(:one)
  end

  test "should get index" do
    get smart_locks_url
    assert_response :success
  end

  test "should get new" do
    get new_smart_lock_url
    assert_response :success
  end

  test "should create smart_lock" do
    assert_difference('SmartLock.count') do
      post smart_locks_url, params: { smart_lock: { company_id: @smart_lock.company_id, property_id: @smart_lock.property_id, serial_num: @smart_lock.serial_num } }
    end

    assert_redirected_to smart_lock_url(SmartLock.last)
  end

  test "should show smart_lock" do
    get smart_lock_url(@smart_lock)
    assert_response :success
  end

  test "should get edit" do
    get edit_smart_lock_url(@smart_lock)
    assert_response :success
  end

  test "should update smart_lock" do
    patch smart_lock_url(@smart_lock), params: { smart_lock: { company_id: @smart_lock.company_id, property_id: @smart_lock.property_id, serial_num: @smart_lock.serial_num } }
    assert_redirected_to smart_lock_url(@smart_lock)
  end

  test "should destroy smart_lock" do
    assert_difference('SmartLock.count', -1) do
      delete smart_lock_url(@smart_lock)
    end

    assert_redirected_to smart_locks_url
  end
end
