Rails.application.routes.draw do
  resources :want_list_items, except: %i[index, new, create]

  resources :want_lists do
    member do
      get :items
    end
  end

  root 'dashboards#index'

  devise_for :users

  resources :users, except: %i[new, create]
end
