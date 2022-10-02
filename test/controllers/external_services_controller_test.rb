require "test_helper"

class ExternalServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @external_service = external_services(:one)
  end

  test "should get index" do
    get external_services_url
    assert_response :success
  end

  test "should get new" do
    get new_external_service_url
    assert_response :success
  end

  test "should create external_service" do
    assert_difference('ExternalService.count') do
      post external_services_url, params: { external_service: { enabled: @external_service.enabled, extras: @external_service.extras, service_name: @external_service.service_name } }
    end

    assert_redirected_to external_service_url(ExternalService.last)
  end

  test "should show external_service" do
    get external_service_url(@external_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_external_service_url(@external_service)
    assert_response :success
  end

  test "should update external_service" do
    patch external_service_url(@external_service), params: { external_service: { enabled: @external_service.enabled, extras: @external_service.extras, service_name: @external_service.service_name } }
    assert_redirected_to external_service_url(@external_service)
  end

  test "should destroy external_service" do
    assert_difference('ExternalService.count', -1) do
      delete external_service_url(@external_service)
    end

    assert_redirected_to external_services_url
  end
end
