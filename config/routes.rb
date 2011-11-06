EnsaludpsiRails::Application.routes.draw do  
  resources :users
  resources :sessions
  
  resources :questions
  
  root                  :to => 'pages#home'
  
  match '/matypat',     :to => 'pages#mat_y_pat'
  match '/consultorio', :to => 'pages#consultorio'
  match '/contacto',    :to => 'pages#contacto'
  
  get "logout" => "sessions#destroy", :as => "logout"
  get "login"  => "sessions#new",     :as => "login"
  get "signup" => "users#new",        :as => "signup"

  match "/toggle_admin" => "users#toggle_admin"
  match "/toggle_editor" => "users#toggle_editor"


end
