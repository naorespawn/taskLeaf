Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  root to: 'tasks#index'

  namespace :admin do
    resources :users
  end
  resources :tasks
end
