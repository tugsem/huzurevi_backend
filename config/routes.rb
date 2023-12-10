Rails.application.routes.draw do
resources :users, only: [:index, :destroy]
  namespace :api do
    namespace :v1 do
      resources :stocks, :stock_logs
    end
  end
  get '/me', to: 'users#show'
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
