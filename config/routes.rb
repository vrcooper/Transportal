Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  get 'welcome/index'
  resources :users, only: [:update, :show]

  get 'welcome/about'

  root to: 'welcome#index'
end
