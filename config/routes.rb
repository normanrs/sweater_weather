Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  namespace :api do
    namespace :v1 do
      get :forecast, to: 'forecast#show'
      get :gifs, to: 'gifs#show'
      get :favorites, to: 'favorites#index'
      post :users, to: 'users#create'
      post :sessions, to: 'sessions#create'
      post :favorites, to: 'favorites#create'
      delete :favorites, to: 'favorites#delete'

    end
  end
end
