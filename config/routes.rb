Rails.application.routes.draw do
  
  devise_for :users
  get 'welcome/index'
  resources :users, only: [:update, :show]

  resources :projects, only:[:index, :show, :new, :create, :destroy]

  #resources :documents
  resources :documents, only:[:index, :show, :new, :edit]

  get 'welcome/about'

  root to: 'welcome#index'
end