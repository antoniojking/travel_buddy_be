Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show, :create] do
        resources :friendships, only: [:index, :create]
      end
      resources :parks, only: [:index, :show]
      resources :trips, only: [:create]
    end
  end
end
