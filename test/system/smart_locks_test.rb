require "application_system_test_case"

class SmartLocksTest < ApplicationSystemTestCase
  setup do
    @smart_lock = smart_locks(:one)
  end

  test "visiting the index" do
    visit smart_locks_url
    assert_selector "h1", text: "Smart Locks"
  end

  test "creating a Smart lock" do
    visit smart_locks_url
    click_on "New Smart Lock"

    fill_in "Company", with: @smart_lock.company_id
    fill_in "Property", with: @smart_lock.property_id
    fill_in "Serial num", with: @smart_lock.serial_num
    click_on "Create Smart lock"

    assert_text "Smart lock was successfully created"
    click_on "Back"
  end

  test "updating a Smart lock" do
    visit smart_locks_url
    click_on "Edit", match: :first

    fill_in "Company", with: @smart_lock.company_id
    fill_in "Property", with: @smart_lock.property_id
    fill_in "Serial num", with: @smart_lock.serial_num
    click_on "Update Smart lock"

    assert_text "Smart lock was successfully updated"
    click_on "Back"
  end

  test "destroying a Smart lock" do
    visit smart_locks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Smart lock was successfully destroyed"
  end
end
