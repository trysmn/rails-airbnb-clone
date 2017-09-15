Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'flats#index'

  resources :flats do
    resources :bookings
    resources :reviews, only: [:new, :create]
    resources :perk_quantities, only: [:new, :create, :destroy]
  end


  resources :profiles, only: [:new, :create, :show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Attachinary::Engine => "/attachinary"
end
