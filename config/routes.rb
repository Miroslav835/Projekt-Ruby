Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

  root "movies#index"

  resources :movies
  resources :screen_rooms
  resources :screenings do
    resources :reservations, only: :create
  end
  resources :reservations, only: %i[edit update destroy]

  get "admin", to: "admin#index", as: :admin
end