# # frozen_string_literal: true

# Rails.application.routes.draw do
#   devise_for :users
#   root to: 'pages#home'
#   resources :category_payments
#   resources :payments
#   resources :categories
#   resources :users
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"
# end

Rails.application.routes.draw do
  devise_for :users, sign_out_via: %i[get post]
  # Defines the root path route ("/")
  root to: 'pages#home'
  resources :categories, only: %i[index new create] do
    resources :payments, only: %i[index]
  end
  resources :payments, only: %i[new create]
end
