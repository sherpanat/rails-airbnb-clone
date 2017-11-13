Rails.application.routes.draw do
  root to: 'families#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :families, only: %i(show)

  namespace :my do
    resources :bookings, only: %i(index create)
    resources :reviews, only: %i(create)
  end

end
