require "application_system_test_case"

class ExternalServicesTest < ApplicationSystemTestCase
  setup do
    @external_service = external_services(:one)
  end

  test "visiting the index" do
    visit external_services_url
    assert_selector "h1", text: "External Services"
  end

  test "creating a External service" do
    visit external_services_url
    click_on "New External Service"

    check "Enabled" if @external_service.enabled
    fill_in "Extras", with: @external_service.extras
    fill_in "Service name", with: @external_service.service_name
    click_on "Create External service"

    assert_text "External service was successfully created"
    click_on "Back"
  end

  test "updating a External service" do
    visit external_services_url
    click_on "Edit", match: :first

    check "Enabled" if @external_service.enabled
    fill_in "Extras", with: @external_service.extras
    fill_in "Service name", with: @external_service.service_name
    click_on "Update External service"

    assert_text "External service was successfully updated"
    click_on "Back"
  end

  test "destroying a External service" do
    visit external_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "External service was successfully destroyed"
  end
end
