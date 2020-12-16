Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :items
      resources :containers
      resources :categories
      resources :types
      get 'users/:id/items', :to => 'users#user_items'
      post 'users/:id/items/new', :to => 'users#new_user_item'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
