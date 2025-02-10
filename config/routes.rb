Rails.application.routes.draw do
  resources :registration, only: %i[new create]
  resource :session
  resources :passwords, param: :token
  resources :messages
  resources :rooms
  get "up" => "rails/health#show", as: :rails_health_check
  root "rooms#index"
 end