Rails.application.routes.draw do
  mount ApplicationServerManagement::Engine => "/application_server_management"
end
