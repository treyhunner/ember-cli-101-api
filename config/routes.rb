Rails.application.routes.draw do
  resources :blog_posts, only: [:index, :show, :create, :update]
  resources :comments, only: [:index, :show, :create, :destroy]
end
