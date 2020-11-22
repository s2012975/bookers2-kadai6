Rails.application.routes.draw do
  
  root to: 'homes#top'
  
  
  get 'home/about' => 'homes#about', as: 'about'
  
  get '/users/:id/follows' => 'users#follows', as: 'follows'
  get '/users/:id/followers' => 'users#followers', as: 'followers'
  get '/search/search' => 'search#search', as: 'search'
  
  devise_for :users
  
  resources :users, only: [:show,:index,:edit,:update]
  
  resources :relationships, only: [:create, :destroy]
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
end