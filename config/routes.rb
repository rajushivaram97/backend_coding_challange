Rails.application.routes.draw do
  resources :apps, only: [:index] do# Add other resources and routes as needed
    get 'unpurchased', on: :collection
end
