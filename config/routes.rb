Rails.application.routes.draw do
  resources :notes

  # Routes for Google auth
  get "auth/:provider/callback" => "sessions#create"
  get "auth/failure" => "sessions#auth_failure"
  get "signout" => "sessions#destroy", as: :signout

  resource :sessions, only: [:create, :destroy]

  root 'site#home'
end
