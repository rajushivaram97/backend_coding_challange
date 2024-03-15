Rails.application.routes.draw do
  resources :apps, only: [:index] # Add other resources and routes as needed
end
