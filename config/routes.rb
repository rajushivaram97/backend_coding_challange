Rails.application.routes.draw do
  resources :apps, only: [:index] do
    get 'unpurchased', on: :collection
    get 'by_names', on: :collection, defaults: { format: 'json' }
  end
end
