Rails.application.routes.draw do
  
  devise_for :users
  get 'welcome/index'
  resources :users, only: [:update, :show]

  resources :projects
  
  resources :projects do
    resources :documents
  end
  #resources :documents
  #resources :documents, only:[:index, :show, :new, :edit]

  get 'welcome/about'

  root to: 'welcome#index'
end