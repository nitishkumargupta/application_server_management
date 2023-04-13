ApplicationServerManagement::Engine.routes.draw do
  get "/applications" => "application_servers#index"
  post "/applications" => "application_servers#create"
  get "/applications/:id" => "application_servers#show"
  patch "/applications/:id" => "application_servers#update"
  put "/applications/:id" => "application_servers#update"
  delete "/applications/:id" => "application_servers#destroy"
  get "/application/regenerate_token/:id" => "tokens#regenerate_token"
  get "/application/retrieve_token/:id" => "tokens#retrieve_token"
  get "/application/get-application-by-token" => "tokens#get_application_using_token"
end
