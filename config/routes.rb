Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users, only:[:index, :show, :edit, :update]
  get 'users/:id/post', to: 'users#user_post'
  root to: "posts#index"
end
