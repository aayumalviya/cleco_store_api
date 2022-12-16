Rails.application.routes.draw do
  default_url_options :host => "cleco-store.herokuapp.com"
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post 'sign_up', to: 'registrations#create'
        post 'sign_in', to: 'sessions#create'
        delete 'sign_out', to: 'sessions#destroy'
      end
      resources :categories
      resources :sub_categories
      resources :products do
        collection do
          get 'new_arrivals'
          get 'top_sellings'
        end
      end
      resources :cart_items
      resources :wish_lists
      resources :orders
      resources :delivery_addresses
      resources :notifications
      get 'user_profile', to: 'users#user_profile'


    # get 'filter', to: 'products#filter_products'
    end
  end
end
