Rails.application.routes.draw do
  resources :followings
  resources :talks
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root "talks#index"
end
