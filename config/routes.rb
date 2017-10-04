Rails.application.routes.draw do
  resources :want_list_items
  resources :want_lists
  root 'users#index'
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
