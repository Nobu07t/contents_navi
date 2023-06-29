Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :spots, only: [:index, :new, :create, :show, :edit, :update, :destroy]do
  resources :comments, only: :create
end
  resources :users, only: :show
end