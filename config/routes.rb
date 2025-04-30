Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: %i[index show edit update]
  
  # ログインユーザー向けのusers/postsコントローラー
  namespace :users do
    resources :posts, only: %i[new create edit update destroy]
  end

  # 一般ユーザー向けのpostsコントローラー
  resources :posts, only: %i[index show]
  
  root "posts#index"
end
