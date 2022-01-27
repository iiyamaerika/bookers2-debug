Rails.application.routes.draw do
  get 'chats/show'
  get 'relationships/followings'
  get 'relationships/followers'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  get "search" => "searches#search"





  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites,only:[:create, :destroy]
    resources :post_comments,only:[:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update]do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get "daily_posts" => "users#daily_posts"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :chats, only: [:show, :create]
  
  resources :groups, only: [:new, :index, :show, :create, :edit, :update]do
    resource :group_users, only: [:create, :destroy]
  end

end
