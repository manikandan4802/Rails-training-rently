require "application_system_test_case"

class LockCodesTest < ApplicationSystemTestCase
  setup do
    @lock_code = lock_codes(:one)
  end

  test "visiting the index" do
    visit lock_codes_url
    assert_selector "h1", text: "Lock Codes"
  end

  test "creating a Lock code" do
    visit lock_codes_url
    click_on "New Lock Code"

    fill_in "Code", with: @lock_code.code
    check "Invitation" if @lock_code.invitation
    fill_in "Property", with: @lock_code.property_id
    fill_in "Smart lock", with: @lock_code.smart_lock_id
    click_on "Create Lock code"

    assert_text "Lock code was successfully created"
    click_on "Back"
  end

  test "updating a Lock code" do
    visit lock_codes_url
    click_on "Edit", match: :first

    fill_in "Code", with: @lock_code.code
    check "Invitation" if @lock_code.invitation
    fill_in "Property", with: @lock_code.property_id
    fill_in "Smart lock", with: @lock_code.smart_lock_id
    click_on "Update Lock code"

    assert_text "Lock code was successfully updated"
    click_on "Back"
  end

  test "destroying a Lock code" do
    visit lock_codes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lock code was successfully destroyed"
  end
end
