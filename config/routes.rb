Rails.application.routes.draw do
  use_doorkeeper

   namespace :api do
    namespace :v1 do
      
      get '/users/me', to: 'users#me'
      resources :users
      resources :questions 
      resources :answers
      resources :tags, only: :index
    end
  end
end
