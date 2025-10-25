Rails.application.routes.draw do
  root "books#index"
  
  resources :books
  
  resources :authors, only: [:index, :show]
  
  get "up" => "rails/health#show", as: :rails_health_check
end
