Rails.application.routes.draw do

  devise_for :users
	root to: 'welcome#index'
<<<<<<< HEAD
	namespace :admin do
		# resources :students
		resources :users
	end
=======
	resources :students,  only: :show 
>>>>>>> ticket-5
end
