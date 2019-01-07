Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get :forecast, to: 'forecast#show'
      get :gifs, to: 'gifs#show'
      get :favorites, to: 'favorites#index'
      post :users, to: 'users#create'
      post :sessions, to: 'sessions#create'
      post :favorites, to: 'favorites#create'

    end
  end
end
