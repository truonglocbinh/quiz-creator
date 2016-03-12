Rails.application.routes.draw do
  get 'socials/infor'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root "static_page#home"
  get "static_page/about"
  get "preview", to: "preview#show", as: :preview
  get "preview/main", to: "preview#main", as: :main
  get "profile", to: "users#show", as: :profile
  resources :groups, :users
  resources :subjects do
    resources :questions
  end
  resources :exams do
    resources :questions
  end
  namespace :admin do
    root "users#index"
    resources :users, :categories
  end
  namespace :api do
    resources :users
  end
end
