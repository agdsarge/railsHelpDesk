Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :isps
  resources :clients
  resources :tickets
  resources :comments, except: [:index, :destroy, :show]
  resources :professionals

  get '/' => 'sessions#new'
  get 'client_welcome' => 'application#client_welcome'
  get 'professionals/:id/tickets/' => 'professionals#my_tickets', as: "my_tickets"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  post '/logout' => 'sessions#destroy'
  get '/:random' => 'application#retry'




end
