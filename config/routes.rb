Rails.application.routes.draw do
  root to: "events#index"
  devise_for :users

  resources :events do
    resources :comments, only: %i[create destroy]
    resources :subscriptions, only: %i[create destroy]
    resources :photos, only: %i[create destroy]
  end
  resources :users, only: %i[show edit update]
end
