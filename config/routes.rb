Rails.application.routes.draw do

  resources :gossips

  root 'page#index'
  get '/contact', to: 'page#contact'
  get '/team', to: 'page#team'
  get '/welcome/:input', to: 'page#welcome'
  
end