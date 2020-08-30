Rails.application.routes.draw do
  # #add custom routes here
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :reviews
  resources :user_projects
  resources :projects
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
