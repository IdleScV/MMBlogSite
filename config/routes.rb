Rails.application.routes.draw do
  resources :applets, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :blogs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/',to: "application#homepage", as: "homepage"

end
