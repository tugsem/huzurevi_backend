Rails.application.routes.draw do
resources :users, only: [:index, :destroy]

  namespace :api do
    namespace :v1 do
      resources :patients do
        member do
          get 'notes', to: 'notes#recent_notes'
          post 'notes', to: 'notes#create_note'
        end
        resources :medication_records
      end
        resources :stocks, :stock_logs, :nurses
    end
  end

  get '/me', to: 'users#show'
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
