require "application_system_test_case"

module ApplicationServerManagement
  class ApplicationServersTest < ApplicationSystemTestCase
    setup do
      @application_server = application_server_management_application_servers(:one)
    end

    test "visiting the index" do
      visit application_servers_url
      assert_selector "h1", text: "Application servers"
    end

    test "should create application server" do
      visit application_servers_url
      click_on "New application server"

      fill_in "Code", with: @application_server.code
      fill_in "Description", with: @application_server.description
      fill_in "Name", with: @application_server.name
      click_on "Create Application server"

      assert_text "Application server was successfully created"
      click_on "Back"
    end

    test "should update Application server" do
      visit application_server_url(@application_server)
      click_on "Edit this application server", match: :first

      fill_in "Code", with: @application_server.code
      fill_in "Description", with: @application_server.description
      fill_in "Name", with: @application_server.name
      click_on "Update Application server"

      assert_text "Application server was successfully updated"
      click_on "Back"
    end

    test "should destroy Application server" do
      visit application_server_url(@application_server)
      click_on "Destroy this application server", match: :first

      assert_text "Application server was successfully destroyed"
    end
  end
end
