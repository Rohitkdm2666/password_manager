Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  # User routes
  get 'users', to: 'users#index'
  root "users#index"
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create', as: 'users_create'
  get 'login', to: 'users#login', as: 'users_login'
  delete 'users/:id', to: 'users#destroy', as: 'users_destroy'
  post 'login', to: 'users#process_login', as: 'process_login' 


  # Password routes
  get 'passwords', to: 'passwords#index', as: 'passwords_index'
  post 'passwords', to: 'passwords#create', as: 'passwords_create'
  delete 'passwords/:id', to: 'passwords#destroy', as: 'passwords_destroy'
  get 'passwords/:id/edit', to: 'passwords#edit', as: 'passwords_edit'
  patch 'passwords/:id', to: 'passwords#update', as: 'passwords_update'
  



  # resources :students

end
