Rails.application.routes.draw do
  get 'commentlikes/create'
  get 'commentlikes/destroy'
  resources :applets, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :blogs, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :likes, only: [:create]
  end
  resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #* Homepage
  get '/',to: "application#homepage", as: "homepage"
  #* Login
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  #* Logout
  get "/logout", to: "sessions#logout"

  #* Blog likes + comment likes
  get "/blogs/:id/like", to: "likes#destroy", as: "unlike"
  post "/blogs/:id/comments", to: "blogs#newcomment", as: "new_comment"
  get "/blogs/:id/comment/likes", to: "blogs#destroycommentlike", as: "unlike_comment"
  post "/blogs/:id/comments/likes", to: "blogs#newcommentlike", as: "like_comment"
end
