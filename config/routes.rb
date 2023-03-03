Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources "books", only: [:index, :show, :new, :create, :destroy] do
    resources "reservations", only: [:create, :show]
  end
  resources "reservations", only: [:new, :index, :destroy]
end
