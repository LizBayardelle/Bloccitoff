Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :users, only: [:show]

  get 'home/index'
  root 'home#index'

  resources :lists do
    resources :items
  end

end
