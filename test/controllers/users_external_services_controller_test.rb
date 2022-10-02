require "test_helper"

class UsersExternalServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_external_service = users_external_services(:one)
  end

  test "should get index" do
    get users_external_services_url
    assert_response :success
  end

  test "should get new" do
    get new_users_external_service_url
    assert_response :success
  end

  test "should create users_external_service" do
    assert_difference('UsersExternalService.count') do
      post users_external_services_url, params: { users_external_service: { external_mail: @users_external_service.external_mail, external_service_id: @users_external_service.external_service_id, user_id: @users_external_service.user_id } }
    end

    assert_redirected_to users_external_service_url(UsersExternalService.last)
  end

  test "should show users_external_service" do
    get users_external_service_url(@users_external_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_external_service_url(@users_external_service)
    assert_response :success
  end

  test "should update users_external_service" do
    patch users_external_service_url(@users_external_service), params: { users_external_service: { external_mail: @users_external_service.external_mail, external_service_id: @users_external_service.external_service_id, user_id: @users_external_service.user_id } }
    assert_redirected_to users_external_service_url(@users_external_service)
  end

  test "should destroy users_external_service" do
    assert_difference('UsersExternalService.count', -1) do
      delete users_external_service_url(@users_external_service)
    end

    assert_redirected_to users_external_services_url
  end
end
