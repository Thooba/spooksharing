Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources 'books', only: [:index, :show, :new, :create, :destroy] do
    resources 'reservations', only: [ :new, :create]
  end
  resources :reservations, only: :destroy
end
