# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, sign_out_via: %i[get post]
  # Defines the root path route ("/")
  resources :categories, only: %i[index new create] do
    resources :payments, only: %i[index]
  end
  resources :payments, only: %i[new create]
  root to: 'pages#home'
end
