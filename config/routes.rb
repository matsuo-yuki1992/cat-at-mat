Rails.application.routes.draw do
 resources :users
 resources :groups
 resources :posts
 
  devise_for :admins
  devise_for :users
  root to:"homes#top"
end
