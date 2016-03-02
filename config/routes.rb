Rails.application.routes.draw do


  resources :books
  resources :skills
  resources :fights

  root 'books#index'

  get '/rank', to: 'books#rank', as: 'rank'


end
