# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  
  root to: 'home#index'

  # Users
  resources :users, only: [:show, :edit]
end
