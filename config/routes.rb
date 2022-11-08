Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories
      resources :sub_categories
      resources :products
    end
  end

end
