Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :paraphrases

  resources :themes
end
