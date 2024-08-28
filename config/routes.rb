Rails.application.routes.draw do
  devise_for :users
  root to: 'homepages#index'
  resources :homepages
  resources :buses
  resources :routes
  resources :bookings
  resources :trains

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
   end
end

