Rails.application.routes.draw do
  root to: "public/homes#top"
  
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
  }
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }
  
  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :posts, only: [:index, :show, :destroy] do
      resources :posts_comment, only: [:destroy]
    end
  end
  
  scope module: :public do
    resources :users, only: [:show] do
      collection do
        get :mypage
      end
    end
    resources :groups
    resources :posts, only: [:edit, :index, :new, :show, :create] do
      resources :post_comments, only: [:create]
    end
    resources :homes, only: [] do
      collection do
        get :about
      end
    end
  end
end
