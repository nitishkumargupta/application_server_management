class CreateApplicationServerManagementApplicationServers < ActiveRecord::Migration[7.0]
  def change
    create_table :application_server_management_application_servers do |t|
      t.string :name
      t.string :code
      t.text :description

      t.timestamps
    end
  end
end
