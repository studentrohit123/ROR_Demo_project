Rails.application.routes.draw do
  devise_for :users
  root to: 'homepages#index'
  resources :homepages
end
