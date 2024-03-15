Rails.application.routes.draw do
  resources :apps, only: [:index] # Add other resources and routes as needed
  get 'users/high_volume_purchasers', to: 'users#high_volume_purchasers'
end
