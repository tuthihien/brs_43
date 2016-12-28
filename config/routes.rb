
Rails.application.routes.draw do
  root "static_pages#home"
  get "detail" => "static_pages#detail"
  get "signup" => "users#new"
  get "login" =>  "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :users
  resources :reviews

  resources :users do
    member do
      get :following, :followers
    end
  end

  namespace :admin do
    resources :books
    resources :categories
    resources :users, only: :destroy
  end

  resources :books
  resources :categories
  resources :search_books, only: :create
  resources :rates
  resources :relationships, only: [:create, :destroy]
  resources :account_activations, only: :edit
end
