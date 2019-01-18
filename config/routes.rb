Rails.application.routes.draw do

  devise_for :users, controllers: { confirmations: "users/confirmations" }
	root to: 'welcome#index'
	namespace :admin do
		resources :students
		resources :users
    resources :contracts
	end
	resources :students,  only: :show
end
