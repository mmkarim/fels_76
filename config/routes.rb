Rails.application.routes.draw do
  root             "static_pages#home"
  get "help"    => "static_pages#help"
  get "about"   => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "signup"  => "users#new"

  resources :users do
    resources :following, :followers, only: [:index]
  end

  resources :categories, only: [:show, :index] do
    resources :lessons
  end

  resources :relationships, only: [:create, :destroy]
  resources :users
  resources :words, only: [:index, :show]

  namespace :admin do
    resources :categories, only: [:new, :edit, :create, :update]
    resources :words, only: [:new, :edit, :create, :update]
    resources :choices, only: [:create, :delete]
  end

  resources :users
  get "login"   => "sessions#new"
  post "login"  => "sessions#create"
  delete "logout" => "sessions#destroy"
end
