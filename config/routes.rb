Rails.application.routes.draw do
  # Головна сторінка - список книг
  root "books#index"
  
  # Web маршрути
  resources :books
  resources :authors, only: [:index, :show]
  resources :imports, only: [:index, :new, :create, :show]
  
  # API v1
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :books, only: [:index, :show]
      resources :authors, only: [:index, :show]
    end
  end
  
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end