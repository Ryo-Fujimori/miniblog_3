Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: %i[index show edit update]

  # 一般ユーザー向けのpostsコントローラー
  resources :posts, only: %i[index show]

  # ログインユーザー向けのusers/postsコントローラー
  resources :posts, only: %i[new create edit update destroy], module: :users, as: :user_posts
  
  root "posts#index"
end
