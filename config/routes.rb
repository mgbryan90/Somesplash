Rails.application.routes.draw do
  root to: "categories#index"
  resources :categories
  resources :photos, except: [:index]
  resources :comments, only: %i[create destroy]
  get "/search", to: "photos#search"
end
