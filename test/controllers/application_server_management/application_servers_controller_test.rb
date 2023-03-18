require "test_helper"

module ApplicationServerManagement
  class ApplicationServersControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @application_server = application_server_management_application_servers(:one)
    end

    test "should get index" do
      get application_servers_url
      assert_response :success
    end

    test "should get new" do
      get new_application_server_url
      assert_response :success
    end

    test "should create application_server" do
      assert_difference("ApplicationServer.count") do
        post application_servers_url, params: { application_server: { code: @application_server.code, description: @application_server.description, name: @application_server.name } }
      end

      assert_redirected_to application_server_url(ApplicationServer.last)
    end

    test "should show application_server" do
      get application_server_url(@application_server)
      assert_response :success
    end

    test "should get edit" do
      get edit_application_server_url(@application_server)
      assert_response :success
    end

    test "should update application_server" do
      patch application_server_url(@application_server), params: { application_server: { code: @application_server.code, description: @application_server.description, name: @application_server.name } }
      assert_redirected_to application_server_url(@application_server)
    end

    test "should destroy application_server" do
      assert_difference("ApplicationServer.count", -1) do
        delete application_server_url(@application_server)
      end

      assert_redirected_to application_servers_url
    end
  end
end
