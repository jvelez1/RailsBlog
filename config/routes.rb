Rails.application.routes.draw do

  resources :comments
  resources :users
  root 'welcome#index'
  get 'about', to: 'welcome#about'

  resources :articles
  
end
