Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root "static_page#home"
  get "static_page/about"
  resources :subjects do
    resources :questions
  end
  resources :exams do
    resources :questions
  end
end
