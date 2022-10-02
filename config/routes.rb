Rails.application.routes.draw do
  resources :meetings
  resources :users_external_services
  resources :external_services
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'vue/index'

  root to: 'vue#index'  
end
