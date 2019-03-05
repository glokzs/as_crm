# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  root to: 'welcome#index'
  namespace :admin do
    resources :students
    resources :users
    resources :contracts
    resources :courses
    resources :groups
    resources :templates
    resources :sections
    resources :clauses
    resources :teachers
    resources :themes
    resources :lessons do
      resources :homeworks do
      end
      resources :reviews
    end
    resources :requisites

    resources :homeworks
  end
  resources :students, only: :show
  resources :courses, only: :show
  resources :groups, only: :show
  resources :teachers, only: :show
  resources :courses, only: :show
  resources :groups, only: :show
  resources :teachers, only: %i[show edit update ] do
    member do 
     get 'show_profile_teacher'
    end
  end
  resources :students, only: %i[show edit update ] do
    member do 
     get 'show_profile_student'
    end
  end

  resources :lessons do
    resources :reviews
  end
  
  resources :themes
  resources :homeworks
end
