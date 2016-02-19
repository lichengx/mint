Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :visitors
  resources :galleries
  get '/uploads/:class/:attachment/:id/:style/:filename', to: 'assets#show'
end
