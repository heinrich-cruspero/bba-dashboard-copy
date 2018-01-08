Rails.application.routes.draw do
  resources :books, except: %i[new, create, edit, update, destroy, show] do
    member do
      get :details
    end
  end

  resources :want_list_items, except: %i[index, new, show]

  resources :want_lists, except: %i[show] do
    member do
      get :items
    end
  end

  root 'books#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :users, except: %i[new, create, show]
end
