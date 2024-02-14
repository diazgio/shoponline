Rails.application.routes.draw do
  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create], path: '/register', path_names: { new: '/' }
    resources :sessions, only: [:new, :create, :destroy], path: '/login', path_names: { new: '/' }
  end
  get 'users/made_admin', to: 'users#made_admin', as: :made_admin
  get 'transactions/seller', to: 'transactions#seller_index', as: :seller_transactions
  resources :transactions
  resources :favorites, only: [:index, :create, :destroy], param: :product_id
  resources :users, only: :show, path: '/user'
  resources :categories, except: %i[ show ]
  resources :products, path: '/'
  
  get "up" => "rails/health#show", as: :rails_health_check
end
