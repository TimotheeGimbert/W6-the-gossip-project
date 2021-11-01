Rails.application.routes.draw do
  root 'page#index'
  get '/contact', to: 'page#contact'
  get '/team', to: 'page#team'
end