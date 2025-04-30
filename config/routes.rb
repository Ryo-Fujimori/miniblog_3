Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  
  # ログインユーザー向けのusers/posts, relationshipsコントローラー
  namespace :users do
    resources :posts, only: %i[new create edit update destroy]
    resources :relationships, only: %i[create destroy]
  end
  
  # 一般ユーザー向けのpostsコントローラー
  resources :posts, only: %i[index show]
  
  resources :users, only: %i[index show edit update]
  root "posts#index"
end
