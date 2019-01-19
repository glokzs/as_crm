Rails.application.routes.draw do

  devise_for :users, controllers: { confirmations: "users/confirmations" }
	root to: 'welcome#index'
	namespace :admin do
		resources :students
		resources :users
    resources :contracts
    resources :courses
    resources :groups
	end
	resources :students,  only: :show
  resources :courses,  only: :show
  resources :groups,  only: :show
end
