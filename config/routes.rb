Rails.application.routes.draw do
  get "socials/infor"

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root "static_page#home"
  get "static_page/about"
  get "preview", to: "preview#show", as: :preview
  get "preview/main", to: "preview#main", as: :main
  get "profile", to: "users#show", as: :profile
  get "add_user", to: "add_user_to_group#find_user", as: :add_user
  post "result", to: "add_user_to_group#result_of_find_user", as: :result
  get "add_exam", to: "add_exam_to_group#add_exam", as: :add_exam
  resources :users
  resources :groups do
    resources :user_groups
    resources :exam_groups
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
  end
end
