class AddOrganisationIdinApplicationServer < ActiveRecord::Migration[7.0]
  def change
    add_column :application_server_management_application_servers, :organisation_id, :integer
  end
end
