Rails.application.routes.draw do
  root to: "public/homes#top"
  
  devise_for :admins, skip: [:registrations], controllers: {
    sessions: "admins/sessions",
  }
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
  }
  
  namespace :admin do
    resources :users, only: [:index]
  end
  
  scope module: :public do
    resources :users, only: [:show] do
      collection do
        get :mypage
      end
    end
    resources :groups
    resources :posts
    resources :homes, only: [] do
      collection do
        get :about
        get :search
      end
    end
  end
end
