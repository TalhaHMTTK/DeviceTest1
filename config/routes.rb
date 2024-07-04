Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }

  resources :users
  
  resources :companies
  get "up" => "rails/health#show", as: :rails_health_check

  root "companies#index"
end
