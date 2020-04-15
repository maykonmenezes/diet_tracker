Rails.application.routes.draw do
  devise_for :users
  root to: "dashboard#index"
  resources :dashboard, only: %i[index]
  resources :diets, only: %i[index new create show edit update destroy]
  resources :weights, only: %i[new create]
end
