Rails.application.routes.draw do

  # For javascript tests
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  resources :users do
    resources :notes
    resources :note_books do
      resources :notes, controller: 'note_books/notes'
    end

  end

  # Routes for Google auth
  get "auth/:provider/callback" => "sessions#create"
  get "auth/failure" => "sessions#auth_failure"
  get "signout" => "sessions#destroy", as: :signout

  resources :sessions, only: [:create, :destroy]

  get '/add_note/:note_id' => 'note_books#add_note', as: :add_note
  root 'site#home'
end
