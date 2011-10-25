EnsaludpsiRails::Application.routes.draw do  
  root                  :to => 'pages#home'
  
  match '/matypat',     :to => 'pages#mat_y_pat'
  match '/consultorio', :to => 'pages#consultorio'
  match '/contacto',    :to => 'pages#contacto'


end
