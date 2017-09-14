Rails.application.routes.draw do
  devise_for :users
  root to: 'flats#index'

  resources :flats do
    resources :bookings
    resources :reviews, only: [:new, :create]
    resources :perk_quantities, only: [:new, :create, :destroy]
    collection do
      get 'search'
    end
  end

  resources :users, only: [] do
    resources :profiles, only: [:new, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Attachinary::Engine => "/attachinary"
end
