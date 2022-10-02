Rails.application.routes.draw do
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :external_services
      resources :users
      resources :meetings
    end
  end

  resources :external_services
  resources :meetings
  resources :users
  resources :users_external_services
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'vue/index'

  root to: 'vue#index'  
end
