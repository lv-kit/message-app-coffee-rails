Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :welcome, only: [:index]
  resources :users, only: [:index, :show, :edit, :update]
  resources :messages, only: [:create]
  resources :rooms, only: [:index, :show, :create, :edit, :update]
  root "welcome#index"
end
