Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show, :create] do
        resources :friendships, only: [:index, :create]
      end
      resources :parks, only: [:index, :show]
      resources :weather, only: [:index]
      resources :trips, only: [:create, :show, :update] do
        resources :accommodations, only: [:index, :create]
        resources :travel_buddies, only: [:index, :create]
        resources :activities, only: [:index, :create]
        resources :checklists, only: [:index, :create] do
          resources :checklist_items, only: [:index, :create]
        end
      end
    end
  end
end
