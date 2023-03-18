ApplicationServerManagement::Engine.routes.draw do
  resources :application_servers, as: 'applications'
end
