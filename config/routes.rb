Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users

      resources :items, except: :update
      get 'users/:id/items', :to => 'users#user_items'
      post 'users/:user_id/items/new', :to => 'items#new_user_item'
      put 'items/:id/:user_id', :to => 'items#update'
      delete 'users/:user_id/user_items/:item_id', :to => 'user_items#destroy'

      resources :containers
      post 'users/:user_id/containers/new', :to => 'containers#new_user_container'
      delete 'users/:user_id/user_containers/:container_id', :to => 'user_containers#destroy'

      resources :categories
      post 'users/:user_id/categories/new', :to => 'categories#new_user_category'
      delete 'users/:user_id/user_categories/:category_id', :to => 'user_categories#destroy'

      resources :types
      
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
