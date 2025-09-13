Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  # User routes
  get 'users', to: 'users#index'
  get 'users/new', to: 'users#new', as: 'new_user'
  post 'users/create', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/update/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  post 'users/login', to: 'users#login'

end
