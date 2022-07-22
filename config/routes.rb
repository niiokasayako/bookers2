Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get '/home/about' => 'homes#about', as: 'about'
  
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  


end
