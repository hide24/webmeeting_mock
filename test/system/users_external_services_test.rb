require "application_system_test_case"

class UsersExternalServicesTest < ApplicationSystemTestCase
  setup do
    @users_external_service = users_external_services(:one)
  end

  test "visiting the index" do
    visit users_external_services_url
    assert_selector "h1", text: "Users External Services"
  end

  test "creating a Users external service" do
    visit users_external_services_url
    click_on "New Users External Service"

    fill_in "External mail", with: @users_external_service.external_mail
    fill_in "External service", with: @users_external_service.external_service_id
    fill_in "User", with: @users_external_service.user_id
    click_on "Create Users external service"

    assert_text "Users external service was successfully created"
    click_on "Back"
  end

  test "updating a Users external service" do
    visit users_external_services_url
    click_on "Edit", match: :first

    fill_in "External mail", with: @users_external_service.external_mail
    fill_in "External service", with: @users_external_service.external_service_id
    fill_in "User", with: @users_external_service.user_id
    click_on "Update Users external service"

    assert_text "Users external service was successfully updated"
    click_on "Back"
  end

  test "destroying a Users external service" do
    visit users_external_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Users external service was successfully destroyed"
  end
end
