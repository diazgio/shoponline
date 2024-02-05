Rails.application.routes.draw do
  resources :categories, except: %i[ show ]
  resources :products
  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create]
  end
  
  get "up" => "rails/health#show", as: :rails_health_check
end
