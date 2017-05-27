Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:show, :index]
  resources :posts
  resources :comments
  resources :friendships, only:[:create,:update, :destroy]
  resources :likes, only:[:create, :destroy]
  root 'staticpages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
