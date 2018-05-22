Rails.application.routes.draw do
  resources :reviews
  resources :search, only: [:index]
  resources :authors
  resources :books do
    collection do
      get '/auth/:provider/callback', to: 'books#callback'
    end
  end
  resources :twilios do
  	collection do
  		post :verify_phone
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
