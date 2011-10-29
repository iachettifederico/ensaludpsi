EnsaludpsiRails::Application.routes.draw do  
  resources :users
  resources :questions
  
  root                  :to => 'pages#home'
  
  match '/matypat',     :to => 'pages#mat_y_pat'
  match '/consultorio', :to => 'pages#consultorio'
  match '/contacto',    :to => 'pages#contacto'
  
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"


end
