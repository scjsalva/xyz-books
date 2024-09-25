Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  
  resources :books, only: [:show] do
    member do
      get 'isbn(/:format)', to: 'books#isbn'
    end
  end
end
