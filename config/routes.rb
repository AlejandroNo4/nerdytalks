Rails.application.routes.draw do
  resources :talks, only: [:index, :create, :destroy]
  resources :users, only: [:show, :new, :edit, :update, :create, :destroy]

  get "follow_user", to: "followings#create"
  get "unfollow_user", to: "followings#destroy"

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root "talks#index"
end
