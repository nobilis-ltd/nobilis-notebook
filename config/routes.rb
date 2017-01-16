Rails.application.routes.draw do


  get 'note_book/index'

  get 'note_book/show'

  get 'note_book/create'

  get 'note_book/new'

  get 'note_book/edit'

  get 'note_book/update'

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

  resources :sessions, only: [:create, :destroy]

  root 'site#home'
end
