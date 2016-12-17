Rails.application.routes.draw do
  get 'notes/index'
  get 'site/home'

  root 'site#home'
end
