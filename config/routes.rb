Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }

  resources :users
  resources :customers
  resources :companies
  resources :locations
  resources :devices

  get '/all_customers', to: 'customers#all_customers'
  get "up" => "rails/health#show", as: :rails_health_check

  root "companies#index"
end
