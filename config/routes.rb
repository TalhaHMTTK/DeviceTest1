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
  get "up" => "rails/health#show", as: :rails_health_check

  root "companies#index"
end
