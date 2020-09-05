Rails.application.routes.draw do
  # get 'registrations/Devise::RegistrationsController'
  # devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'sessions#home'
  devise_for :users

  # get '/auth/google_oauth2/callback', to
  as :user do
    get '/signin', to: 'devise/sessions#new'
    get '/sign_out', to: 'devise/sessions#destroy'
  end

  get '/auth/google', to: 'sessions#google'
  # #add custom routes here
  # get '/signup' => 'users#new'
  # post '/signup' => 'users#create'

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'

  # delete '/logout' => 'sessions#destroy'

  resources :reviews
  resources :user_projects
  resources :projects
  resources :users, except: %i[new create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
