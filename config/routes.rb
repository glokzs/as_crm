Rails.application.routes.draw do


  devise_for :users
	root to: 'welcome#index'
	namespace :admin do
		resources :students
		resources :users
    
		resources :courses

	end
	resources :students,  only: :show 
  resources :courses,  only: :show
end
