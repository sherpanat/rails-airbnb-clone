Rails.application.routes.draw do
  devise_for :users

  root to: 'families#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :families, only: %i(index show) do
    resources :bookings, only: %i(create)
  end
  resources :bookings, only: %i(index)
end
