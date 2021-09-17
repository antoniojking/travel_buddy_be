Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show, :create] do
        resources :friendships, only: [:index, :create]
      end
      resources :parks, only: [:index, :show]
      resources :trips, only: [:create, :show] do
        resources :travel_buddies, only: [:index, :create]
        resources :activities, only: [:index, :create]
        resources :checklists, only: [:index, :create]
      end
    end
  end
end
