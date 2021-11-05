Rails.application.routes.draw do

  resources :likes, only:[:create]
  resources :sessions, only:[:new, :create, :destroy]
  resources :cities, only:[:show]
  resources :users, only:[:show, :new, :create]
  resources :gossips

  get '/team', to: 'page#team'
  get '/welcome/:input', to: 'page#welcome' 

  root 'page#index'
  
end