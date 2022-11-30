# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  resources :category_payments
  resources :payments
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
