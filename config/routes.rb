Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :users, only: :show
  resources :paraphrases do
    resources :comments, only: :create
  end

  resources :themes
end
