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
  root to: 'homes#index'

  resources :conversations, only: [:index, :show, :create]
  resources :messages, only: :create

  get '/users/account_options', to: 'accounts#index'

  resources :conversation, only: :index

  # Petitions routes
  resources :petitions do
    collection do
      get '/categories', to: 'categories#index'
      get '/subcategories', to: 'subcategories#index'
    end
  end

  # Sales routes
  resources :sales do
    collection do
      get '/categories', to: 'categories#index'
      get '/subcategories', to: 'subcategories#index'
    end
  end

  match '/404', to: 'errors#not_found', via: :all
  match '/422', to: 'errors#permission_denied', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  # search
  resources :searches do
    collection do
      get '/', to: 'searches#search_by_title'
      get '/category', to: 'searches#search_by_category'
      get '/subcategory', to: 'searches#search_by_subcategory'
    end
  end
  resources :addresses, only: [:index, :create, :update, :destroy]
  resources :search_catalogs, only: :index

  resources :user do
    resources :notifications
  end
end
