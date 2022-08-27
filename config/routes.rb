Rails.application.routes.draw do
  root to: "events#index"
  devise_for :users

  resources :comments do
    resources :comments, only: %i[create destroy]
  end
  resources :events
  resources :users, only: %i[show edit update]
end
