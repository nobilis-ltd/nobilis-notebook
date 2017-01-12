Rails.application.routes.draw do


  # For javascript tests
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  resources :users do
    resources :notes
    resources :note_books

  end

  # Routes for Google auth
  get "auth/:provider/callback" => "sessions#create"
  get "auth/failure" => "sessions#auth_failure"
  get "signout" => "sessions#destroy", as: :signout
  get "note_book" => "note_books#index"
  get "/note_book/new" => "note_books#create"

  resources :sessions, only: [:create, :destroy]

  root 'site#home'
end
