Rails.application.routes.draw do
  root to: "events#index"
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :events do
    resources :comments, only: %i[create destroy]
    resources :subscriptions, only: %i[create destroy]
    resources :photos, only: %i[create destroy]

    post :show, on: :member
    patch :delete_bg_image, on: :member
  end
  resources :users, only: %i[show edit update]
end
