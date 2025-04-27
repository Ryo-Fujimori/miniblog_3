Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: %i[index show edit update]
  resources :posts
  root "users#index"
end
