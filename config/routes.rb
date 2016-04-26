Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root "static_page#home"
  get "socials/infor"
  get "static_page/about"
  get "preview", to: "preview#show", as: :preview
  get "preview/main", to: "preview#main", as: :main
  get "profile", to: "users#show", as: :profile
  get "add_user", to: "add_user_to_group#find_user", as: :add_user
  post "result", to: "add_user_to_group#result_of_find_user", as: :result
  get "add_exam", to: "add_exam_to_group#add_exam", as: :add_exam
  get "all_class", to: "my_class#all_class", as: :all_class
  get "assignexam", to: "assign_exam#show", as: :show_assign
  post "assign", to: "assign_exam#assign", as: :assign
  get "show_class", to: "my_class#show_one_class", as: :show_class
  get "exam/start_exam", to: "my_class#main", as: :start_exam
  resources :users, :notifications
  resources :groups do
    resources :user_groups
    resources :exam_groups
    resources :exam_users
  end
  
  namespace :user do 
    resources :exam_users
  end 

  resources :subjects do
    resources :questions
  end
  resources :exams do
    resources :questions
    resource  :setting
  end
  namespace :admin do
    root "users#index"
    resources :users, :categories
  end
  namespace :api do
    resources :users
    resources :categories
    resources :exams
    resources :groups
    resources :exam_users
  end
end
