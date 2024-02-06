Rails.application.routes.draw do
  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create], path: '/register', path_names: { new: '/' }
    resources :sessions, only: [:new, :create, :destroy], path: '/login', path_names: { new: '/' }
  end

  resources :users, only: :show, path: '/user'
  resources :categories, except: %i[ show ]
  resources :products, path: '/'
  
  get "up" => "rails/health#show", as: :rails_health_check
end
