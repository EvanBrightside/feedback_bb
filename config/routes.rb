Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :feedbacks do
      resources :replies, only: %w[new create]
    end
    root to: 'feedbacks#index'
  end
  resources :feedbacks, only: %w[new create]
  root to: 'feedbacks#new'

  get 'feedbacks/new'
  get 'feedbacks/create'
end
