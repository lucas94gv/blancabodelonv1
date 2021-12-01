Rails.application.routes.draw do
  resources :categories

  match "admin" => 'categories#index', via: [:get, :post]

  get 'web/web_home'

  devise_for :users
  
  root 'web#web_home'
end
