class AddAlertResponseCodeInApplicationServer < ActiveRecord::Migration[7.0]
  def change
    add_column :application_server_management_application_servers, :alert_response_codes, :text
  end
end
