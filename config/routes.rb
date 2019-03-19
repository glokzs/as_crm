# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations' }
  root to: 'welcome#index'
  namespace :admin do
    post '/homeworks/:homework_id/approve_send_homeworks' => 'homeworks#approve_send_homework', as: 'approve_send_homework'
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
  resources :teachers, only: %i[show edit update] 
  get '/teachers/:teacher_id/show_profile_teacher' => 'teachers#show_profile_teacher', as: 'show_profile_teacher'

  resources :students, only: %i[show edit update] 
  get '/students/:student_id/show_profile_student' => 'students#show_profile_student', as: 'show_profile_student'

  resources :lessons do
    resources :reviews
  end

  resources :themes
  resources :homeworks
end
