Rails.application.routes.draw do
  get 'notes/index'
  get 'site/home'

  # Routes for Google auth 
  get "auth/:provider/callback" => "sessions#create"
  get "auth/failure" => redirect("/")
  get "signout" => "sessions#destroy", as: :signout

  resource :sessions, only: [:create, :destroy]

  root 'site#home'
end
