Rails.application.routes.draw do
  resources :rooms, only: [:index, :show]
  resource :session, only: [:new, :create, :destroy]

  mount ActionCable.server => '/cable'

  root 'rooms#index'
end
