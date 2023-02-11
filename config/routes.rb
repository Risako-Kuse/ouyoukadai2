Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about", as: "about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do #親子関係にする
    resources :book_comments, only: [:create, :destroy] # コメント
    resource :favorites, only: [:create, :destroy] # イイね
  end

  resources :users, only: [:index,:show,:edit,:update] do
    get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  	resource :relationships, only: [:create, :destroy]
  end

   get '/search', to: 'searches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end