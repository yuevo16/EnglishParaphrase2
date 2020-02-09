Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  namespace :themes do
    resources :paraphrases, only: [:show, :new, :create, :destroy], shallow: true
  end

  resources :users, only: :show
  
  resources :paraphrases do
    member do
      get 'add'
    end
    resources :comments, only: :create, shallow: true
  end

  resources :themes



end
