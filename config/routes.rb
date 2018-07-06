Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :client do
    get "/contacts" => "contacts#index"
    get "/contacts/new" => "contacts#new"
    post "/contacts" => "contacts#create"
    get "/contacts/:id" => "contacts#show"

  end
end
