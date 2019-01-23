require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

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
