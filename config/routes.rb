Rails.application.routes.draw do
  # Route for login in development environment
	if Rails.env == 'development'
		get '/dev_login' => 'sessions#create_dev_session'
	end

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
