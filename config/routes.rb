Rails.application.routes.draw do
  resources :want_list_items
  resources :want_lists do
    member do
      get :items
    end
  end
  root 'dashboards#index'
  devise_for :users
  resources :users
end
