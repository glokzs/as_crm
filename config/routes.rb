Rails.application.routes.draw do

  get 'students/show'
  devise_for :users
	root to: 'welcome#index'
	resources :students,  only: :show 
end
