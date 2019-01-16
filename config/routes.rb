Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  namespace :admin do
    resources :students
    resources :users
    resources :groups
  end
  resources :students,  only: :show 
  resources :groups,  only: :show 
end