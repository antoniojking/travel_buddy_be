Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :show do
        resources :friendships, only: [:index, :create]
      end
      resources :parks, only: [:index, :show]
    end
  end
end
