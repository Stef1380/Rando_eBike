Rails.application.routes.draw do
  devise_for :users
  root to: "bikes#index"

  resources :bikes, except: [:index, :update, :edit] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
