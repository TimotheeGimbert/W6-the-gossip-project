Rails.application.routes.draw do

  resources :sessions, only:[:new, :create, :destroy]
  resources :cities, only:[:show]
  resources :users, only:[:show]
  resources :gossips

  root 'page#index'
  get '/contact', to: 'page#contact'
  get '/team', to: 'page#team'
  get '/welcome/:input', to: 'page#welcome'
  
end