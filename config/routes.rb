Rails.application.routes.draw do
  root             "static_pages#home"
  get "help"    => "static_pages#help"
  get "about"   => "static_pages#about"
  get "contact" => "static_pages#contact"
  get "signup"  => "users#new"
    resources :users

  get "lessons" => "categories#index"
  resources :categories, only: [:show, :index]

  get "words"   => "words#show"
  resources :words, only: [:show]

  namespace :admin do
    resources :categories, only: [:new, :edit, :create]
  end
end
