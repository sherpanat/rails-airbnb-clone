Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :families, only: %i(index show new create edit update destroy) do
    resources :bookings, only: %i(create)
  end
  resources :bookings, only: %i(index update)
end
