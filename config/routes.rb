Rails.application.routes.draw do

  get 'want_lists/list_user'

  resources :books, except: %i[new, create, edit, update, destroy] do
    member do
      get :details
    end
  end

  resources :want_list_items, except: %i[index, new, create]

  resources :want_lists do
    member do
      get :items
    end
  end

  root 'books#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :users, except: %i[new, create]
end
