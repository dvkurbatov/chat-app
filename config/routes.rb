Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'channels#index'
  resource :sessions, only: [:new, :create, :destroy]
  resources :channels, except: [:edit, :update]
  resources :users, only: :index
  #resources :private_channels
  resources :messages, only: [:create]

  mount ActionCable.server => '/cable'
end
