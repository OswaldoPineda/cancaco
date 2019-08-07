require 'sidekiq/web'
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # routes for devise
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get 'confirmations', to: 'confirmations#registration'
  end

  # Sidekiq
  mount Sidekiq::Web => '/sidekiq'

  # Root path
  root to: 'home#index'

  get '/users/account_options', to: 'account#index'

  # Categories routes
  resources :categories, only: :index

  # Subcategories routes
  resources :subcategories, only: :index

  resources :conversation, only: :index
  resources :petitions, only: [:new, :create]
  get '/search', to: 'search#search_by_title', as: 'search_by_title'
  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#permission_denied', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
