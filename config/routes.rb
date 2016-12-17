Rails.application.routes.draw do
  resources :notes

  resources :users

  # Routes for Google auth 
  get "auth/:provider/callback" => "sessions#create"
  get "auth/failure" => redirect("/")
  get "signout" => "sessions#destroy", as: :signout

  resources :sessions, only: [:create, :destroy]

  get 'site/home'
  root 'site#home'
end
