Rails.application.routes.draw do
  get 'registrations/Devise::RegistrationsController'
  # devise_for :users
  root to: 'sessions#home'

  # #add custom routes here
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  resources :reviews
  resources :user_projects
  resources :projects
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
