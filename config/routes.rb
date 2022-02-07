Rails.application.routes.draw do

  resources :photos, only: [:new, :create, :index, :edit, :update]
  
  resources :categories do
    member do
      patch :move
    end
  end

  match "admin" => 'categories#index', via: [:get, :post]
  
  get 'web/web_home'

  devise_for :users
  
  root 'web#web_home'
end
