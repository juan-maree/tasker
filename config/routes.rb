# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :projects
  devise_for :users

  root to: "home#index"
  get "home/index"
  get "search" => "search#index"

  resources :users, only: [:show, :edit, :update]
  resources :tasks, only: [:new, :create, :show, :edit, :update, :destroy]

  scope "api/v1" do
    resources :tasks_json
  end
end
