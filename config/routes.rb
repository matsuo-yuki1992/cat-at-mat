Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
 resources :users
 resources :groups
 resources :posts
 

  root to:"homes#top"
  get "home/about" => "homes#about"
  get "home/search" => "homes#search"
end
