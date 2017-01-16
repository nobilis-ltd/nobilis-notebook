Rails.application.routes.draw do


  # For javascript tests
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  resources :users do
    resources :notes

  end

  # Routes for Google auth
  get "auth/:provider/callback" => "sessions#create"
  get "auth/failure" => "sessions#auth_failure"
  get "signout" => "sessions#destroy", as: :signout

  resources :sessions, only: [:create, :destroy]

  root 'site#home'
end
