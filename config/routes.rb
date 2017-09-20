Rails.application.routes.draw do
  resources :reviews
  resources :search, only: [:index]
  resources :authors
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
