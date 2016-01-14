Rails.application.routes.draw do
  

  devise_for :users
  get 'welcome/index'
  resources :users, only: [:update, :show]

  resources :projects, only:[:index, :new, :create, :destroy]

  get 'welcome/about'

  root to: 'welcome#index'
end