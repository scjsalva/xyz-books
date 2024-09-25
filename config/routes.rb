Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  
  resources :books, only: [:show]
end
