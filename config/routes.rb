Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :isps
  resources :clients
  resources :tickets
  resources :comments
  resources :professionals

  get '/' => 'sessions#new'
  get 'welcome' => 'application#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  post '/logout'=> 'sessions#destroy'




end
