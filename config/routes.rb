Rails.application.routes.draw do
  get '/reporting_pages', to: 'reporting_pages#index'

  resources :rental_returns do
    collection do
      post :import
    end
  end
  resources :fedex_accounts
  resources :easy_post_accounts
  resources :thrift_orders, only: %i[index] do
    member do
      get :items
    end
  end
  resources :audits
  resources :tracked_skus, only: %i[index]
  resources :accounts
  resources :custom_isbns
  resources :books, except: %i[new create edit update destroy show] do
    member do
      get :details
    end
  end

  resources :want_list_items, except: %i[show]

  resources :want_lists, except: %i[show] do
    member do
      get :items
      get :export
    end
  end

  root 'books#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :users, except: %i[new create show]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :valore_orders, only: %i[] do
        collection do
          get :pending_orders
          get :search_status
        end
      end
    end
  end
end
