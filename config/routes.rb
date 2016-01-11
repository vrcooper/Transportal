Rails.application.routes.draw do
  get 'project/index'

  get 'project/new'

  get 'project/create'

  get 'project/destroy'

  get 'users/show'

  devise_for :users
  get 'welcome/index'
  resources :users, only: [:update, :show]

  resources :projects, only:[:index, :new, :create, :destroy]

  get 'welcome/about'

  root to: 'welcome#index'
end