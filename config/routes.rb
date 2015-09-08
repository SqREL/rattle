require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    get  :search, on: :collection
    resource :comment, only: :create, controller: 'posts/comments'
    resource :vote, only: :create, controller: 'posts/votes'
  end

  mount Sidekiq::Web => '/sidekiq'

  root to: 'posts#index'
end
